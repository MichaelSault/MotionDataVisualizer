import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

//declare tranformation vars
float moveLeftSpine = 4.7;
float moveLeftHead = 0.0;
float moveLeftLUA = 0.0;
float moveLeftLLA = 0.0;
float moveLeftRUA = 0.0;
float moveLeftRLA = 0.0;
float moveLeftLUL = 0.0;
float moveLeftLLL = 0.0;
float moveLeftRUL = 0.0;
float moveLeftRLL = 0.0;

float up = 0.0;
float turn = 0.0;

float up1 = 0.0;
float turn1 = 0.0;
float forward = 250.0;
float sideways = 0;
boolean mouseClicked = false;

int bone = 1;

//declaire skeleton shapes
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

Ellipsoid head;

Picked picked = null;



//set up function defines the defaults of the shapes/canvas
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
  
  //define the head
  head = new Ellipsoid(30, 25, 25);
  head.fill(randomColor());
}


//draws the shapes and applies the transformations/translations
void draw() {
  background(0);
  keyPressedIsCheckedContinuusly();
  
  
  
  
  pushMatrix();
  translate(width/2, height/2+200, -200);

  if(mouseClicked){
    picked = Shape3D.pick(this, getGraphics(), mouseX, mouseY);
    if (picked != null) {
      if ((picked.shape == spine)||(picked.shape == hips)||(picked.shape == shoulders)){
        bone = 1;
      } else if (picked.shape == head) {
        bone = 2;
      } else if (picked.shape == leftUpArm) {
        bone = 3;
      } else if (picked.shape == leftLowArm) {
        bone = 4;
      } else if (picked.shape == rightUpArm) {
        bone = 5;
      } else if (picked.shape == rightLowArm) {
        bone = 6;
      } else if (picked.shape == leftUpLeg) {
        bone = 7;
      } else if (picked.shape == leftLowLeg) {
        bone = 8;
      } else if (picked.shape == rightUpLeg) {
        bone = 9;
      } else if (picked.shape == rightLowLeg) {
        bone = 10;
      }
    } else if (picked == null){
      mouseClicked = false;
    }
  }
  
  //affects the entire skeleton as is is before any object is drawn
  translate(sideways, 0, forward);
  translate(0, -200, 0);
  
  println(picked);
  
  rotateY(moveLeftSpine);
  
  
  
  //full body/ spinal translations
  spine.draw(getGraphics());
  translate(0, -80, 0);
  shoulders.draw(getGraphics());
  translate(0, 180, 0);
  hips.draw(getGraphics());
  
  //moves head into position
  translate(0, -220, 0);
 
  //starts matrix for the head
  pushMatrix();
  //translations for the head
  rotateY(moveLeftHead);
  head.draw(getGraphics());
  popMatrix();
  
  //translations for left arm
  translate(0, 40, 65);
  
  pushMatrix();
  rotateZ(moveLeftLUA);
  translate(0, 50, 0);
  leftUpArm.draw(getGraphics());
  pushMatrix();
  translate(0, 50, 0);
  rotateZ(moveLeftLLA);
  translate(0, 40, 0);
  leftLowArm.draw(getGraphics());
  popMatrix();
  popMatrix();
  
  //translations for right arm
  translate(0, 10, -130);
  
  pushMatrix();
  rotateZ(moveLeftRUA);
  translate(0, 40, 0);
  rightUpArm.draw(getGraphics());
  pushMatrix();
  translate(0, 50, 0);
  rotateZ(moveLeftRLA);
  translate(0, 40, 0);
  rightLowArm.draw(getGraphics());
  popMatrix();
  popMatrix();
  
  //translations for left leg
  translate(0, 210, 115);
  pushMatrix();
  leftUpLeg.draw(getGraphics());
  pushMatrix();
  translate(0, 90, 0);
  leftLowLeg.draw(getGraphics());
  popMatrix();
  popMatrix();
  
  //translations for right leg
  translate(0, 0, -100);
  pushMatrix();
  rightUpLeg.draw(getGraphics());
  pushMatrix();
  translate(0, 90, 0);
  rightLowLeg.draw(getGraphics());
  popMatrix();
  popMatrix();
  
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
      if (bone == 1){ //bone 1 is spine
        moveLeftSpine -= 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        moveLeftHead -= 0.01;       
      }
      else if (bone == 3){ //bone 2 is head
        moveLeftLUA -= 0.01;       
      }
      else if (bone == 4){ //bone 2 is head
        moveLeftLLA -= 0.01;       
      }
      else if (bone == 5){ //bone 2 is head
        moveLeftRUA -= 0.01;       
      }
      else if (bone == 6){ //bone 2 is head
        moveLeftRLA -= 0.01;       
      }
      else if (bone == 7){ //bone 2 is head
        moveLeftLUL -= 0.01;       
      }
      else if (bone == 8){ //bone 2 is head
        moveLeftLLL -= 0.01;       
      }
      else if (bone == 9){ //bone 2 is head
        moveLeftRUL -= 0.01;       
      }
      else if (bone == 10){ //bone 2 is head
        moveLeftRLL -= 0.01;       
      }
      
      
    } else if ((key == 'l')||(key == 'L')){
      if (bone == 1){ //bone 1 is spine
        moveLeftSpine += 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        moveLeftHead += 0.01;       
      }
      else if (bone == 3){ //bone 2 is head
        moveLeftLUA += 0.01;       
      }
      else if (bone == 4){ //bone 2 is head
        moveLeftLLA += 0.01;       
      }
      else if (bone == 5){ //bone 2 is head
        moveLeftRUA += 0.01;       
      }
      else if (bone == 6){ //bone 2 is head
        moveLeftRLA += 0.01;       
      }
      else if (bone == 7){ //bone 2 is head
        moveLeftLUL += 0.01;       
      }
      else if (bone == 8){ //bone 2 is head
        moveLeftLLL += 0.01;       
      }
      else if (bone == 9){ //bone 2 is head
        moveLeftRUL += 0.01;       
      }
      else if (bone == 10){ //bone 2 is head
        moveLeftRLL += 0.01;       
      }
      
    } else if ((key == 'i')||(key == 'I')){
      if (up < 0.78){
        up += 0.01;
      }
    } else if ((key == 'k')||(key == 'K')){
      if (up > 0.0){
        up -= 0.01;
      }
    //} else if ((key == 's')||(key == 'S')){
    //  if (forward < 500){
    //    forward += 1;
    //  }
    //} else if ((key == 'w')||(key == 'W')){
    //  if (forward > 0){
    //    forward -= 1;
    //  }
    //} else if ((key == 'a')||(key == 'A')){
    //  if (sideways > -250){
    //    sideways -= 1;
    //  }
    //} else if ((key == 'd')||(key == 'D')){
    //  if (sideways < 250){
    //    sideways += 1;
    //  }
    }
  }
  
}

//==========================================================================
int randomColor(){
  return color(random(0,255), random(0,255), random(0,255));
}

//==========================================================================
void mouseClicked(){
  mouseClicked = true;
}
