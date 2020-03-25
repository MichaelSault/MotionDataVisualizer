import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

//declare tranformation vars for X-axis
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

//declare tranformation vars for Z-axis
float moveUpSpine = 4.7;
float moveUpHead = 0.0;
float moveUpLUA = 0.0;
float moveUpLLA = 0.0;
float moveUpRUA = 0.0;
float moveUpRLA = 0.0;
float moveUpLUL = 0.0;
float moveUpLLL = 0.0;
float moveUpRUL = 0.0;
float moveUpRLL = 0.0;


//declare tranformation vars for Y-axis
float turnSpine = 4.7;
float turnHead = 0.0;
float turnLUA = 0.0;
float turnLLA = 0.0;
float turnRUA = 0.0;
float turnRLA = 0.0;
float turnLUL = 0.0;
float turnLLL = 0.0;
float turnRUL = 0.0;
float turnRLL = 0.0;


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
  //translations for the head (needs work)
  rotateY(moveLeftHead);
  rotateZ(moveUpHead);
  head.draw(getGraphics());
  popMatrix();
  
  //translations for left arm
  translate(0, 40, 65);
  
  pushMatrix();
  rotateX(moveLeftLUA);
  rotateY(turnLUA);
  rotateZ(moveUpLUA);
  translate(0, 50, 0); //moves the rotation point of the limb away from center
  leftUpArm.draw(getGraphics());
  pushMatrix();
  translate(0, 50, 0);
  rotateX(moveLeftLLA);
  rotateY(turnLLA);
  rotateZ(moveUpLLA);
  translate(0, 40, 0); //moves the rotation point of the limb away from center
  leftLowArm.draw(getGraphics());
  popMatrix();
  popMatrix();
  
  //translations for right arm
  translate(0, 10, -130);
  
  pushMatrix();
  rotateX(moveLeftRUA);
  rotateZ(moveUpRUA);
  translate(0, 40, 0); //moves the rotation point of the limb away from center
  rightUpArm.draw(getGraphics());
  pushMatrix();
  translate(0, 50, 0);
  rotateX(moveLeftRLA);
  rotateZ(moveUpRLA);
  translate(0, 40, 0); //moves the rotation point of the limb away from center
  rightLowArm.draw(getGraphics());
  popMatrix();
  popMatrix();
  
  //translations for left leg
  translate(0, 170, 115);
  pushMatrix();
  rotateX(moveLeftLUL);
  rotateZ(moveUpLUL);
  translate(0, 40, 0);
  leftUpLeg.draw(getGraphics());
  pushMatrix();
  translate(0, 40, 0);
  rotateZ(moveLeftLLL);
  translate(0, 50, 0);
  leftLowLeg.draw(getGraphics());
  popMatrix();
  popMatrix();
  
  //translations for right leg
  translate(0, 0, -100);
  pushMatrix();
  rotateX(moveLeftRUL);
  rotateZ(moveUpRUL);
  translate(0, 40, 0);
  rightUpLeg.draw(getGraphics());
  pushMatrix();
  translate(0, 40, 0);
  rotateZ(moveLeftRLL);
  translate(0, 50, 0);
  rightLowLeg.draw(getGraphics());
  popMatrix();
  popMatrix();
  
  popMatrix();
  
} 

//=======================================================================
void keyPressedIsCheckedContinuusly() {

  if (keyPressed) {
    if ((key == 'q')||(key == 'Q')){
    //  if (bone == 1){ //bone 1 is spine
    //    moveLeftSpine -= 0.01;       
    //  }
    //  else if (bone == 2){ //bone 2 is head
    //    moveLeftHead += 0.01;       
    //  }
    //  else if (bone == 3){ //bone 3 is left upper arm
    //    moveLeftLUA += 0.01;       
    //  }
    //  else if (bone == 4){ //bone 4 is left lower arm
    //    moveLeftLLA += 0.01;       
    //  }
    //  else if (bone == 5){ //bone 5 is right upper arm
    //    moveLeftRUA += 0.01;       
    //  }
    //  else if (bone == 6){ //bone 6 is right lower arm
    //    moveLeftRLA += 0.01;       
    //  }
    //  else if (bone == 7){ //bone 7 is left upper leg
    //    moveLeftLUL += 0.01;       
    //  }
    //  else if (bone == 8){ //bone 8 is left lower leg
    //    moveLeftLLL += 0.01;       
    //  }
    //  else if (bone == 9){ //bone 9 is right upper leg
    //    moveLeftRUL += 0.01;       
    //  }
    //  else if (bone == 10){ //bone 10 is right lower leg
    //    moveLeftRLL += 0.01;       
    //  }
      
    //} else if ((key == 'e')||(key == 'E')){
    //  if (bone == 1){ //bone 1 is spine
    //    moveLeftSpine -= 0.01;       
    //  }
    //  else if (bone == 2){ //bone 2 is head
    //    moveLeftHead += 0.01;       
    //  }
    //  else if (bone == 3){ //bone 3 is left upper arm
    //    moveLeftLUA += 0.01;       
    //  }
    //  else if (bone == 4){ //bone 4 is left lower arm
    //    moveLeftLLA += 0.01;       
    //  }
    //  else if (bone == 5){ //bone 5 is right upper arm
    //    moveLeftRUA += 0.01;       
    //  }
    //  else if (bone == 6){ //bone 6 is right lower arm
    //    moveLeftRLA += 0.01;       
    //  }
    //  else if (bone == 7){ //bone 7 is left upper leg
    //    moveLeftLUL += 0.01;       
    //  }
    //  else if (bone == 8){ //bone 8 is left lower leg
    //    moveLeftLLL += 0.01;       
    //  }
    //  else if (bone == 9){ //bone 9 is right upper leg
    //    moveLeftRUL += 0.01;       
    //  }
    //  else if (bone == 10){ //bone 10 is right lower leg
    //    moveLeftRLL += 0.01;       
    //  }
        
    } else if ((key == 'a')||(key == 'A')){
      if (bone == 1){ //bone 1 is spine
        moveLeftSpine -= 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        moveLeftHead -= 0.01;       
      }
      else if (bone == 3){ //bone 3 is left upper arm
        if (moveLeftLUA < 3.14){
          moveLeftLUA += 0.01;
        }         
      }
      else if (bone == 4){ //bone 4 is left lower arm
          moveLeftLLA += 0.01;
      }
      else if (bone == 5){ //bone 5 is right upper arm
        moveLeftRUA += 0.01;       
      }
      else if (bone == 6){ //bone 6 is right lower arm
        moveLeftRLA += 0.01;       
      }
      else if (bone == 7){ //bone 7 is left upper leg
        moveLeftLUL += 0.01;       
      }
      else if (bone == 8){ //bone 8 is left lower leg
        moveLeftLLL += 0.01;       
      }
      else if (bone == 9){ //bone 9 is right upper leg
        moveLeftRUL += 0.01;       
      }
      else if (bone == 10){ //bone 10 is right lower leg
        moveLeftRLL += 0.01;       
      }
      
      
    } else if ((key == 'd')||(key == 'D')){
      if (bone == 1){ //bone 1 is spine
        moveLeftSpine += 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        moveLeftHead += 0.01;       
      }
      else if (bone == 3){ //bone 3 is left upper arm
        if (moveLeftLUA > -0.17){
          moveLeftLUA -= 0.01;
        }       
      }
      else if (bone == 4){ //bone 4 is left lower arm
          moveLeftLLA -= 0.01;   
      }
      else if (bone == 5){ //bone 5 is right upper arm
        moveLeftRUA -= 0.01;       
      }
      else if (bone == 6){ //bone 6 is right lower arm
        moveLeftRLA -= 0.01;       
      }
      else if (bone == 7){ //bone 7 is left upper leg
        moveLeftLUL -= 0.01;       
      }
      else if (bone == 8){ //bone 8 is left lower leg
        moveLeftLLL -= 0.01;       
      }
      else if (bone == 9){ //bone 9 is right upper leg
        moveLeftRUL -= 0.01;       
      }
      else if (bone == 10){ //bone 10 is right lower leg
        moveLeftRLL -= 0.01;       
      }
      
      
    } else if ((key == 'w')||(key == 'W')){
      if (bone == 1){ //bone 1 is spine
        moveUpSpine -= 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        moveUpHead -= 0.01;       
      }
      else if (bone == 3){ //bone 3 is left upper arm
        if (moveUpLUA > -3.15){
          moveUpLUA -= 0.01;
        }      
      }
      else if (bone == 4){ //bone 4 is left lower arm
        if (moveUpLLA > -2.62){
          moveUpLLA -= 0.01;
        }
      }
      else if (bone == 5){ //bone 5 is right upper arm
        moveUpRUA -= 0.01;       
      }
      else if (bone == 6){ //bone 6 is right lower arm
        if (moveUpRLA > -2.62){
          moveUpRLA -= 0.01;
        }       
      }
      else if (bone == 7){ //bone 7 is left upper leg
        moveUpLUL -= 0.01;       
      }
      else if (bone == 8){ //bone 8 is left lower leg
        moveUpLLL -= 0.01;       
      }
      else if (bone == 9){ //bone 9 is right upper leg
        moveUpRUL -= 0.01;       
      }
      else if (bone == 10){ //bone 10 is right lower leg
        moveUpRLL -= 0.01;       
      }
      
      
    } else if ((key == 's')||(key == 'S')){
      if (bone == 1){ //bone 1 is spine
        moveUpSpine += 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        moveUpHead += 0.01;       
      }
      else if (bone == 3){ //bone 3 is left upper arm
        if (moveUpLUA < 0.79){
          moveUpLUA += 0.01;
        }       
      }
      else if (bone == 4){ //bone 4 is left lower arm
        if (moveUpLLA < 0.01){
          moveUpLLA += 0.01;
        }
      }
      else if (bone == 5){ //bone 5 is right upper arm
        moveUpRUA += 0.01;       
      }
      else if (bone == 6){ //bone 6 is right lower arm
        if (moveUpRLA < 0.01){
          moveUpRLA += 0.01;
        }      
      }
      else if (bone == 7){ //bone 7 is left upper leg
        moveUpLUL += 0.01;       
      }
      else if (bone == 8){ //bone 8 is left lower leg
        moveUpLLL += 0.01;       
      }
      else if (bone == 9){ //bone 9 is right upper leg
        moveUpRUL += 0.01;       
      }
      else if (bone == 10){ //bone 10 is right lower leg
        moveUpRLL += 0.01;       
      }
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
