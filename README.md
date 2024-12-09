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
