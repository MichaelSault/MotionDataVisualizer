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

Box spine;
Box shoulders;
Box hips;

Box leftUpArm;
Box leftLowArm;
Box rightUpArm;
Box rightLowArm;

Box leftUpLeg;
Box leftLowLeg;
Box rightUpLeg;
Box rightLowLeg;


void setup() {
  size(1280, 720, P3D);
  noFill();
  
  spine = new Box(10, 200, 10);
  spine.fill(randomColor());
  
  shoulders = new Box(10, 15, 125);
  shoulders.fill(randomColor());
  
  hips = new Box(10, 10, 100);
  hips.fill(randomColor());
  
  //define left arm
  leftUpArm = new Box(10, 100, 10);
  leftUpArm.fill(randomColor());
  leftLowArm = new Box(10, 80, 10);
  leftLowArm.fill(randomColor());
  
  //define right arm
  rightUpArm = new Box(10, 100, 10);
  rightUpArm.fill(randomColor());
  rightLowArm = new Box(10, 80, 10);
  rightLowArm.fill(randomColor());
  
  //define left leg
  leftUpLeg = new Box(10, 80, 10);
  leftUpLeg.fill(randomColor());
  leftLowLeg = new Box(10, 100, 10);
  leftLowLeg.fill(randomColor()); 
  
  //define right leg
  rightUpLeg = new Box(10, 80, 10);
  rightUpLeg.fill(randomColor());
  rightLowLeg = new Box(10, 100, 10);
  rightLowLeg.fill(randomColor());
  
  
  
}

void draw() {
  background(0);
  keyPressedIsCheckedContinuusly();
  pushMatrix();
  translate(width/2, height/2+200, -200);
  
  ////draw base
  translate(sideways, 0, forward);
  //base.draw(getGraphics());
 
 //full body/ spinal translations
  translate(0, -200, 0);
  rotateY(left); //yrot);
  spine.draw(getGraphics());
  translate(0, -80, 0);
  shoulders.draw(getGraphics());
  translate(0, 180, 0);
  hips.draw(getGraphics());
  
  //translations for left arm
  translate(0, -130, 65);
  leftUpArm.draw(getGraphics());
  translate(0, 90, 0);
  leftLowArm.draw(getGraphics());
  
  //translations for right arm
  translate(0, -90, -130);
  rightUpArm.draw(getGraphics());
  translate(0, 90, 0);
  rightLowArm.draw(getGraphics());
  
  //translations for left leg
  translate(0, 80, 115);
  leftUpLeg.draw(getGraphics());
  translate(0, 90, 0);
  leftLowLeg.draw(getGraphics());
  
  
  //translations for right leg
  translate(0, -90, -100);
  rightUpLeg.draw(getGraphics());
  translate(0, 90, 0);
  rightLowLeg.draw(getGraphics());
  
  
  
  
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
      if (left > 0){
        left -= 0.01;       
      }
    } else if ((key == 'l')||(key == 'L')){
      if (left < 6.28){
        left += 0.01;
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
