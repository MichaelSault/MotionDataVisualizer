import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

float left = 0.0;
float up = 0.0;
float turn = 0.0;
float left1 = 0.0;
float up1 = 0.0;
float turn1 = 0.0;
Box base;
Box arm;
Box stand;


void setup() {
  fullScreen(P3D);
  noFill();
  
  base = new Box(50,100,50);
  base.fill(randomColor());
  
  arm = new Box(40, 40, 250);
  arm.fill(randomColor());
  
  stand = new Box(50, 125, 50);
}

void draw() {
  background(0);
  keyPressedIsCheckedContinuusly();
  pushMatrix();
  translate(width/2, height/2, -200);
 
  
  rotateY(left1); //yrot);
  stand.draw(getGraphics());
  rotateX(up1);
  translate(0, 0, 100);
  stroke(255, 0, 0);
  arm.draw(getGraphics());
  
 
  // the box was drawn at (0, 0, 0), store that location
  float x = modelX(0, 0, 0);
  float y = modelY(0, 0, 0);
  float z = modelZ(0, 0, 0);
  // clear out all the transformations
  popMatrix();

  // draw another box at the same (x, y, z) coordinate as the other
  pushMatrix();
  translate(x, y, z);
  // rotate around itself
  base.rotateByY(left/100); //yrot);
  base.rotateByX(up/100); //zrot);
  translate(0, 0, 0);
  
  
  
  //rotate with the arm
  rotateY(left1); //yrot);
  rotateX(up1); //zrot);
 
  translate(0, 0, 125);
  // draw a white box outline at (0, 0, 0)
  stroke(255);
  base.draw(getGraphics());
  
  popMatrix();
  
  
} 

//=======================================================================
void keyPressedIsCheckedContinuusly() {
 
  if (keyPressed) {
    if (key == 'a' || key == 'A'){
      left -= 0.01;
    } else if (key == 'd' || key == 'D'){
      left += 0.01;
    } else if (key == 'w' || key == 'W'){
      up += 0.01;
    } else if (key == 's' || key == 'S'){
      up -= 0.01;
    } else if (key == '4'){
      left1 -= 0.01;
    } else if (key == '6'){
      left1 += 0.01;
    } else if (key == '8'){
      up1 += 0.01;
    } else if (key == '5'){
      up1 -= 0.01;
    } 
  } else {
      left = 0;
      up = 0;
  }
  
}

//==========================================================================
int randomColor(){
  return color(random(0,255), random(0,255), random(0,255));
}
