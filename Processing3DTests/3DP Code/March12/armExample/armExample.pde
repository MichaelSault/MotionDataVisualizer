//===============================================================================
// This Program was developed as part of an independednt reseach class
// focusing on Hierarchical Modeling of the human skeleton.
//
// Feel free to use the application to visualize your own motion capture data,
// or add to the source code.
// I only ask that you give me credit if you decide to do so.
//
// Name: Michael Sault
// Student ID: 8459820
// Course: CSI 4103
// School: University of Ottawa
//===============================================================================

import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

float left = 4.7;
float up = 0.0;
float turn = 0.0;
float left1 = 0.0;
float up1 = 0.0;
float turn1 = 0.0;
float forward = 250.0;
float sideways = 0;
Box claw;
Box arm;
Box stand;

Box base;


void setup() {
  size(1280, 720, P3D);
  noFill();
  
  claw = new Box(50,100,50);
  claw.fill(randomColor());
  
  arm = new Box(40, 40, 250);
  arm.fill(randomColor());
  
  stand = new Box(50, 125, 50);
  stand.fill(randomColor());
  
  base = new Box(200, 50, 200);
  base.fill(randomColor());
}

void draw() {
  background(0);
  keyPressedIsCheckedContinuusly();
  pushMatrix();
  translate(width/2, height/2+200, -200);
  
  //draw base
  translate(sideways, 0, forward);
  base.draw(getGraphics());
 
  translate(0, -75, 0);
  rotateY(left); //yrot);
  stand.draw(getGraphics());
  translate(0, -50, 0);
  rotateX(up);
  translate(0, 0, 110);
  stroke(255, 0, 0);
  arm.draw(getGraphics());
  
  rotateZ(turn); //zrot);
  translate(0, 0, 150);
  stroke(255);
  claw.draw(getGraphics());
  
  popMatrix();
  
  
} 

//=======================================================================
void keyPressedIsCheckedContinuusly() {
 
  if (keyPressed) {
    if ((key == 'u')||(key == 'U')){
      turn += 0.01;
    } else if ((key == 'o')||(key == 'O')){
        turn -= 0.01;
    } else if ((key == 'j')||(key == 'J')){
      if ((left >= -0.1) && (left < 6.28)){
        left += 0.01;       
      }
    } else if ((key == 'l')||(key == 'L')){
      if ((left > 0) && (left <= 6.29)){
        left -= 0.01;
      }
    } else if ((key == 'i')||(key == 'I')){
      if (up < 0.78){
        up += 0.01;
      }
    } else if ((key == 'k')||(key == 'K')){
      if (up > 0.0){
        up -= 0.01;
      }
    } else if ((key == 's')||(key == 'S')){
      if (forward < 500){
        forward += 1;
      }
    } else if ((key == 'w')||(key == 'W')){
      if (forward > 0){
        forward -= 1;
      }
    } else if ((key == 'a')||(key == 'A')){
      if (sideways > -250){
        sideways -= 1;
      }
    } else if ((key == 'd')||(key == 'D')){
      if (sideways < 250){
        sideways += 1;
      }
    }
  }
  
}

//==========================================================================
int randomColor(){
  return color(random(0,255), random(0,255), random(0,255));
}
