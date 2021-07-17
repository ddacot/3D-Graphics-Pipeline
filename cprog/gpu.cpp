
#include <glm/vec3.hpp> // glm::vec3
#include <glm/vec4.hpp> // glm::vec4
#include <glm/mat4x4.hpp> // glm::mat4
#include <glm/gtc/matrix_transform.hpp> // glm::translate, glm::rotate, glm::scale, glm::perspective
#include <unistd.h>


#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps.h"
#include <time.h>
#include <stdint.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdfix.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/mman.h>
#include <sys/time.h>


#include "gpu.h"
#include "hps.h"

#define DDR3_FRAME_BUFFER_BASE 0x32000000
#define DDR3_FRAME_BUFFER_SPAN 0x3FFFFFF

//settings for the lightweight HPS-to-FPGA bridge
#define LW_HPS2FPGA_BASE ( 0xFF200000 )
#define LW_HPS2FPGA_SPAN ( 0x10000 )
#define LW_HPS2FPGA_MASK ( LW_HPS2FPGA_SPAN - 1 )
 
//setting for the HPS2FPGA AXI Bridge
#define AXI_HPS2FPGA_BASE (0xC0000000) // axi_master
#define AXI_HPS2FPGA_SPAN (0x04100000) // Bridge span 1GB
#define AXI_HPS2FPGA_MASK ( AXI_HPS2FPGA_SPAN - 1 )

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 600
#define COLOR_DEPTH 0x3FFF
#define SCREEN_AREA  SCREEN_WIDTH*SCREEN_HEIGHT

volatile unsigned int *INSTR_FIFO_IN = NULL;
volatile unsigned int *SDRAM_IN = NULL;
volatile unsigned int *INSTR_FIFO_IN_CSR = NULL;
volatile unsigned int *INSTR_FIFO_OUT = NULL;
volatile unsigned int *VERT_PROCESSING_FIFO_CSR = NULL;
volatile unsigned int *PIXEL_DMA = NULL;
volatile unsigned int *PIXEL_BACK_BUFF = NULL;
volatile unsigned int *RASTER_FIFO_OUT = NULL;
volatile unsigned int *RASTER_FIFO_OUT_CSR = NULL;
volatile unsigned int *PRIM_ASSEMBLY_FIFO_CSR = NULL;

unsigned int * DDR3_FRAME_BUFFER;
unsigned int * lw_virtual_base;
unsigned int * axi_virtual_base;

int memory_file_fd;

int GPUInit()
{
	if( ( memory_file_fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

    // MMAP the lightweight HPS-to-FPGA bridge
    lw_virtual_base = (unsigned int*) mmap( NULL, LW_HPS2FPGA_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, memory_file_fd, AXI_HPS2FPGA_BASE );
	
    if( lw_virtual_base == MAP_FAILED ) {
        printf( "ERROR: lw mmap() failed...\n" );
        close( memory_file_fd );
        return( 1 );
    }

    // MMAP the AXI HPS-to-FPGA bridge
    axi_virtual_base = (unsigned int *)mmap( NULL, AXI_HPS2FPGA_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, memory_file_fd, AXI_HPS2FPGA_BASE );
 
    if( axi_virtual_base == MAP_FAILED ) {
        printf( "ERROR: axi mmap() failed...\n" );
        close( memory_file_fd );
        return( 1 );
    }

	DDR3_FRAME_BUFFER = (unsigned int *) mmap( NULL, DDR3_FRAME_BUFFER_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, memory_file_fd, DDR3_FRAME_BUFFER_BASE );

	if( DDR3_FRAME_BUFFER == MAP_FAILED ) {
        printf( "ERROR: axi mmap() failed...\n" );
        close( memory_file_fd );
        return( 1 );
    }
	//COMPUTE THE ADDRESS FOR EACH FPGA DEVICE
	INSTR_FIFO_IN 			= axi_virtual_base + ( ( unsigned long  )( 0x0 + INSTR_FIFO_IN_BASE ) 	& ( unsigned long)( AXI_HPS2FPGA_MASK)) / sizeof(unsigned int*);
	INSTR_FIFO_IN_CSR		= axi_virtual_base + ( ( unsigned long  )( 0x0 + INSTR_FIFO_IN_CSR_BASE ) & ( unsigned long)( AXI_HPS2FPGA_MASK)) / sizeof(unsigned int*);
	PIXEL_DMA				= axi_virtual_base + ( ( unsigned long  )( 0x0 + PIXEL_DMA_BASE ) & ( unsigned long)( AXI_HPS2FPGA_MASK )) / sizeof(unsigned int*);
	RASTER_FIFO_OUT_CSR		= axi_virtual_base + ( ( unsigned long  )( 0x0 + RASTER_FIFO_BASE ) & ( unsigned long)( AXI_HPS2FPGA_MASK )) / sizeof(unsigned int*);
	PRIM_ASSEMBLY_FIFO_CSR	= axi_virtual_base + ( ( unsigned long  )( 0x0 + PRIM_ASSEMBLY_FIFO_BASE ) & ( unsigned long)( AXI_HPS2FPGA_MASK)) / sizeof(unsigned int*);
	VERT_PROCESSING_FIFO_CSR = axi_virtual_base + ( ( unsigned long )( 0x0 + VERT_PROCESSING_FIFO_BASE ) & ( unsigned long)( AXI_HPS2FPGA_MASK )) / sizeof(unsigned int*);

	return 0;
}

int GPUShutDown()
{
		// clean up our memory mapping and exit
	if( munmap( axi_virtual_base, AXI_HPS2FPGA_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( memory_file_fd );
		return( 1 );
	}
	if( munmap( lw_virtual_base, LW_HPS2FPGA_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( memory_file_fd );
		return( 1 );
	}

	if( munmap( DDR3_FRAME_BUFFER, DDR3_FRAME_BUFFER_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( memory_file_fd );
		return( 1 );
	}
	
	close( memory_file_fd );

	return 0;
}

void transfMatrix(glm::mat4 matrix)
{
	myfloat v1;
	*(INSTR_FIFO_IN) = 8;

	v1.f = matrix[0][0];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[0][1];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[0][2];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[0][3];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);


	v1.f = matrix[1][0];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[1][1];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[1][2];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[1][3];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);

	v1.f = matrix[2][0];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[2][1];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[2][2];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[2][3];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);

	v1.f = matrix[3][0];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[3][1];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[3][2];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);
	v1.f = matrix[3][3];
	*(INSTR_FIFO_IN) = float2int(v1.raw.num);

	*(INSTR_FIFO_IN) = 5;
}
void setTriangleColor(glm::vec3 v1, glm::vec3 v2, glm::vec3 v3)
{
	*(INSTR_FIFO_IN) = 9;

		*(INSTR_FIFO_IN) = (int)(v1.x * 0x3FF);
		*(INSTR_FIFO_IN) = (int)(v1.y * 0x3FF);
		*(INSTR_FIFO_IN) = (int)(v1.z * 0x3FF);

		*(INSTR_FIFO_IN) = (int)(v2.x * 0x3FF);
		*(INSTR_FIFO_IN) = (int)(v2.y * 0x3FF);
		*(INSTR_FIFO_IN) = (int)(v2.z * 0x3FF);

		*(INSTR_FIFO_IN) = (int)(v3.x * 0x3FF);
		*(INSTR_FIFO_IN) = (int)(v3.y * 0x3FF);
		*(INSTR_FIFO_IN) = (int)(v3.z * 0x3FF);
		
	*(INSTR_FIFO_IN) = 5;
}
void drawTriangle(glm::vec3 v1, glm::vec3 v2, glm::vec3 v3)
{
	while (*(INSTR_FIFO_IN_CSR) > 4050);
	myfloat flt;
    *(INSTR_FIFO_IN) = 6;

    	flt.f = v1.x;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = v1.y;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = v1.z;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = 1.;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		
		flt.f = v2.x;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = v2.y;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = v2.z;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = 1.;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);

		flt.f = v3.x;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = v3.y;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = v3.z;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);
		flt.f = 1.;
		*(INSTR_FIFO_IN) = float2int(flt.raw.num);

	*(INSTR_FIFO_IN) = 5;
	
}
void clearScreen(float r, float g, float b)
{
	for (int i=0; i < SCREEN_AREA; i++)
	{
		*((unsigned int*)DDR3_FRAME_BUFFER+i) = ((int)(r*COLOR_DEPTH)) << 20 | ((int)(g*COLOR_DEPTH)) << 10 | ((int)(b*COLOR_DEPTH));
	}
}
int float2int(int f) 
{ 
    int k; 
	int res = 0;
    for (k = 32 - 1; k >= 0; k--) { 
  
        if ((f >> k) & 1) 
			res |= 1 << k;
    } 
	return res;
} 