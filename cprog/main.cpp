#include <stdio.h>
#include <stdlib.h>
#include <glm/gtc/matrix_transform.hpp> // glm::translate, glm::rotate, glm::scale, glm::perspective
#include <glm/glm.hpp>
#include "gpu.h"
#include <iostream>
#include <unistd.h>
#include <chrono>
#include <glm/gtx/string_cast.hpp>
#include <glm/glm.hpp>
#include <sys/time.h> 
#include "tiny_obj_loader.h"
#include <algorithm>
#define TINYOBJLOADER_IMPLEMENTATION
using namespace std;
extern volatile unsigned int *RASTER_FIFO_OUT_CSR;
extern volatile unsigned int *PIXEL_DMA;

typedef std::vector<tinyobj::shape_t> Shape;
typedef std::vector<tinyobj::material_t> Material;
typedef tinyobj::attrib_t Attribute;

float randomavlue(float LO, float HI)
{
	return LO + static_cast <float> (rand()) /( static_cast <float> (RAND_MAX/(HI-LO)));
}

void md(char* argv[])
{
	bool p1,p2 = true;
    Attribute attributes;
    Shape shapes;
    Material materials;

    std::string warn;
    std::string err;

    std::vector<std::pair<tinyobj::real_t, tinyobj::real_t>> vcoord;

    bool ret = tinyobj::LoadObj(&attributes, &shapes, &materials, &warn, &err, argv[1]);
	
    float minx=999;
    float miny=999;

    for(size_t s=0; s < shapes.size(); s++)
    {
    size_t index_offset = 0;
    for (size_t f = 0; f < shapes[s].mesh.num_face_vertices.size(); f++) 
    {
        int face_vertices = shapes[s].mesh.num_face_vertices[f];

        // Loop over vertices in the face.
        tinyobj::index_t idx;
		glm::vec3 vect[3];
		size_t i = 0;
		float r = randomavlue(0,1);
		float g = randomavlue(0,1);
		float b = randomavlue(0,1);

        for (size_t v = 0; v < face_vertices; v++) 
        {   
            // access to vertex
            idx = shapes[s].mesh.indices[index_offset + v];
            tinyobj::real_t vx = attributes.vertices[3*idx.vertex_index + 0];
            tinyobj::real_t vy = attributes.vertices[3*idx.vertex_index + 1];
            tinyobj::real_t vz = attributes.vertices[3*idx.vertex_index + 2];
            
			vect[i].x = vx;
			vect[i].y = vy;
			vect[i].z = vz;
			i++;
            
        }
		
		drawTriangle(vect[0], vect[1], vect[3]);
        vcoord.clear();
        index_offset += face_vertices;
        shapes[s].mesh.material_ids[f];
        
        }
    }
}

int main(int argc, char* argv[]) 
{
	GPUInit();
	
	struct timeval t1, t2;
	double elapsedTime;
	glm::mat4 model(1.0f);
	clearScreen(333,333,333);
	
	gettimeofday(&t1, NULL);
	setTriangleColor(glm::vec3(1,0,0), glm::vec3(0,1,0), glm::vec3(0,0,1));
	
	float ystep = 0;
	for(float i = 0; i < 720.; i+=20.)
	{
		glm::mat4 tempMatrix(1.0f);
		tempMatrix = glm::rotate(tempMatrix, glm::radians(i), glm::vec3(0.0f, 1.0f, 0.0f));
		transfMatrix(tempMatrix);
		drawTriangle(glm::vec3(-0.2, 0.2 - ystep, 0), glm::vec3(-0.2, 0.2 + 10/80. - ystep,0), glm::vec3(-0.2+10/80., 0.2+10/80. -ystep ,0));
		sleep(1);
		ystep += 0.03f;
	}

	while(*RASTER_FIFO_OUT_CSR > 0);
	
	

	gettimeofday(&t2, NULL);
	elapsedTime = (t2.tv_sec - t1.tv_sec) * 1000000.0;      // sec to us
	elapsedTime += (t2.tv_usec - t1.tv_usec) ;   // us to 
	printf("100,000 triangles rendered in T= %.0f microseconds \n\r", elapsedTime);
	elapsedTime = elapsedTime/1000000.;
	printf("Rendering rate (100,000/T(s)) = %.0f triangles/second\n\r", 100000./(elapsedTime));
	
	GPUShutDown();
	return( 0 );
}
