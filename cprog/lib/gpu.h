#ifndef _GPU_H_
#define _GPU_H_
#include <glm/glm.hpp> // glm::vec3

typedef union { 
  
    float f; 
    struct
    { 
        unsigned int num : 32; 
    } raw; 
} myfloat; 


int GPUInit();
int GPUShutDown();

void transfMatrix(glm::mat4 matrix);
void setTriangleColor(glm::vec3 v1, glm::vec3 v2, glm::vec3 v3);
void drawTriangle(glm::vec3 v1, glm::vec3 v2, glm::vec3 v3);
void clearScreen(float r, float g, float b);
int float2int(int f);

#endif /* _GPU_H_ */