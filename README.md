## ComputerGraphics_Lab3
# Rotation Matrix (X-axis & Y-axis) 
I implement this matrix to do the rotation(X-axis).  
([ 1    0       0    0]  
 [ 0  cos(a) -sin(a) 0]  
 [ 0  sin(a)  cos(a) 0]  
 [ 0    0       0    1])  

I implement this matrix to do the rotation(Y-axis).  
([ cos(a)  0  sin(a) 0]  
 [   0     1    0    0]  
 [-sin(a)  0  cos(a) 0]  
 [   0     0    0    1])  
  
 ![alt text](/photo/image.png)  

makeRotX is Pitch  
makeRotY is Yaw  
makeRotZ is Roll  
  
# Model Transformation (Model Matrix)
I calculate the Model matrix with following rule  
Model Matrix = Translation maxtrix × Rrotation matrix × Scale matrix  
Vworld = M x Vlocal   
  
![alt text](/photo/image1.png)  
   
# Camera Transformation (View Matrix)
I use Vector3.UnitY() to create a topVector to calculate the eye matrix.  
  
I use the pos - lookat to calculate the zAxis.  
Then use the topVector cross zAxis to calculate the xAxis.  
Then use the zAxis cross xAxis to calculate the yAxis  
![alt text](/photo/image3.png)  
   
Then calculate the worldView by following picture  
Assume pos = (px, py, pz)  
![alt text](/photo/image2.png)  
![alt text](/photo/image4.png)  
  
# Perspective Rendering
I use aspect to store aspect raito of screen  
I convert the GH_FOV from degrees to radians  
![alt text](/photo/image5.png)  
Then calculate the projection by following picture  
![alt text](/photo/image6.png)  
![alt text](/photo/image7.png)  
  
# Depth Buffer
I caulcate the depth(z) with geometric viewpoint.  
![alt text](/photo/image8.png)  
![alt text](/photo/image9.png)  
reference:https://davidhsu666.com/archives/barycentric-coordinates/  
  
# Camera Control
I use moveSpeed to control the speed of moving.  
Use keyboard w and s to control the camera move forward and backward.  
Use keyboard a and d to control the object move left and right.  
Use keyboard q and e to control the object move up and down.  
![alt text](/photo/image10.png)  
  
# Backculling
I use corss product to determine the widing order of the triangle,enabling backface fulling (skipping back-facing trangles).  
![alt text](/photo/image11.png)  
If crossProduct >= 0: triangle back-facing so it is skipped.  
If crossProduct < 0 : triangle front-facing.  
![alt text](/photo/image12.png)  
  
I complete all the tasks with ChatGPT.I use ChatGPT to help me figure out some part of the source code and help me recognize some concept of task.  
I also use ChatGPT to generate some screenshot for this readme.  

