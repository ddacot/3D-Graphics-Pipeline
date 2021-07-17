# 3D-Graphics-Pipeline
## **Overview**
High-level diagram of the entire system:
![high-level diagram](documentation/diagram.png "Diagram")
## **Modules**
1. **gpu_qsys_inst.v** - Top level module
2. **gpu_sm.v** - reads commands from the instruction fifo and processes them accordingly.
3. **vert_processing.v** - reads the vertices and transforms them according to the transformation matrix (TM = PROJ x VIEW x MODEL).
3. **prim_assembly.v** - reads vertices from the primitive assembly fifo and relays the data to the rasterization module. Can be used to add support for different geometries besides triangles.
4. **raster.sv** - Reads the vertices of a triangle from the primitive assembly fifo, and using the barycentric coordinates, generates a triangles. The shading is achieved by linear interpolation.

An overview of the Qsys system is shown in [qsys_overview.pdf](qsys_overview.pdf). <br>
A more in-depth explanation of the system can be found in the [technical manual](documentation/techman.pdf) <br>

## **Results**
<details>
  <summary>Shaded Triangle</summary>
<img src="documentation/results_img/shaded_triangle_big.jpg" width="500"> 
</details>

<details>
  <summary>A helix of triangles</summary>
<img src="documentation/results_img/triangle_helix.jpg" width="500"> 
</details>

<details>
  <summary>Human face obj model</summary>
<img src="documentation/results_img/obj_human_model.jpg" width="500"> 
</details>

<details>
  <summary>Rendering of 100,000 triangles</summary>
<figure class="video_container">
  <video controls="true" allowfullscreen="true">
    <source src="documentation/results_img/triangles.mp4" type="video/mp4">
  </video>
</figure>
</details>


