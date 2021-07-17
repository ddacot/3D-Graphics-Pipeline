#
TARGET = main

#
ALT_DEVICE_FAMILY ?= soc_cv_av
SOCEDS_ROOT ?= $(SOCEDS_DEST_ROOT)
HWLIBS_ROOT = $(SOCEDS_ROOT)/ip/altera/hps/altera_hps/hwlib
CROSS_COMPILE = arm-linux-gnueabihf-
CFLAGS = -g -Wall  -std=c++11 -D$(ALT_DEVICE_FAMILY) -I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY)   -I$(HWLIBS_ROOT)/include/ -IC:/Users/Gabriel/Documents/GPU/cprog/lib/ -IC:/Users/Gabriel/Documents/GPU/cprog/lib/glm-master/ -O2
LDFLAGS =  -g -Wall -lm 
CC = $(CROSS_COMPILE)g++
ARCH = arm

build: $(TARGET)
$(TARGET): main.o gpu.o tiny_obj_loader.o
	$(CC) $(LDFLAGS)   $^ -o $@  

%.o : %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) *.a *.o *~ 
