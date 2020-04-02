import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

//tranformation vars for X-axis
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
float leanBackHips = 0.0;
float moveLeftLF = 0.0;
float moveLeftRF = 0.0;

float moveLeftLIndex = 0.0;
float moveLeftLMiddle = 0.0;
float moveLeftLRing = 0.0;
float moveLeftLPinky = 0.0;
float moveLeftLThumb = 0.0;
float moveLeftLWrist = 0.0;

float moveLeftRIndex = 0.0;
float moveLeftRMiddle = 0.0;
float moveLeftRRing = 0.0;
float moveLeftRPinky = 0.0;
float moveLeftRThumb = 0.0;
float moveLeftRWrist = 0.0;


//tranformation vars for Z-axis
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
float leanHips = 0.0;
float moveUpLF = 0.0;
float moveUpRF = 0.0;

float moveUpLIndex = 0.0;
float moveUpLMiddle = 0.0;
float moveUpLRing = 0.0;
float moveUpLPinky = 0.0;
float moveUpLThumb = 0.0;
float moveUpLWrist = 0.0;

float moveUpRIndex = 0.0;
float moveUpRMiddle = 0.0;
float moveUpRRing = 0.0;
float moveUpRPinky = 0.0;
float moveUpRThumb = 0.0;
float moveUpRWrist = 0.0;


//tranformation vars for Y-axis
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
float rotHips = 0.0;

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

Box leftFoot;
Box rightFoot;

Ellipsoid head;
//to better visualize the head movement
Ellipsoid leftEye;
Ellipsoid rightEye;


//left hand parts
Box leftPalm;

Box leftProxPhalIndex;
Box leftMidPhalIndex;
Box leftDistalPhalIndex;

Box leftProxPhalMiddle;
Box leftMidPhalMiddle;
Box leftDistalPhalMiddle;

Box leftProxPhalRing;
Box leftMidPhalRing;
Box leftDistalPhalRing;

Box leftProxPhalPinky;
Box leftMidPhalPinky;
Box leftDistalPhalPinky;

Box leftProxPhalThumb;
Box leftDistalPhalThumb;
Box leftMetacarpalThumb;

//right hand parts
Box rightPalm;

Box rightProxPhalIndex;
Box rightMidPhalIndex;
Box rightDistalPhalIndex;

Box rightProxPhalMiddle;
Box rightMidPhalMiddle;
Box rightDistalPhalMiddle;

Box rightProxPhalRing;
Box rightMidPhalRing;
Box rightDistalPhalRing;

Box rightProxPhalPinky;
Box rightMidPhalPinky;
Box rightDistalPhalPinky;

Box rightProxPhalThumb;
Box tightDistalPhalThumb;
Box rightMetacarpalThumb;

Picked picked = null;



//set up function defines the defaults of the shapes/canvas
void setup() {
  size(1280, 720, P3D);
  noFill();
  
  spine = new Box(10, 200, 10);
  spine.fill(randomColor());
  
  shoulders = new Box(10, 15, 90);
  shoulders.fill(randomColor());
  
  hips = new Box(10, 15, 75);
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
  
  //define left foot
  leftFoot = new Box(50, 10, 20);
  leftFoot.fill(randomColor());
  
  
  //define left foot
  rightFoot = new Box(50, 10, 20);
  rightFoot.fill(randomColor());
  
  //define the head
  head = new Ellipsoid(30, 25, 25);
  head.fill(randomColor());
  leftEye =  new Ellipsoid(10, 10, 5);
  int eyes = randomColor(); //makes both eyes the same colour
  leftEye.fill(eyes);
  rightEye =  new Ellipsoid(10, 10, 5);
  rightEye.fill(eyes);
}


//draws the shapes and applies the transformations/translations
void draw() {
  background(0);
  keyPressedIsCheckedContinuusly();
  
  
  
  
  pushMatrix();
  translate(width/2, height/2+200, -200);

 //=======================================================================
 //SHAPE PICKER FUNCTIONS (from Shapes3D Library)
 //=======================================================================
  if(mouseClicked){
    picked = Shape3D.pick(this, getGraphics(), mouseX, mouseY);
    if (picked != null) {
      if (picked.shape == spine){
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
      } else if (picked.shape == hips) {
        bone = 11;
      } else if (picked.shape == shoulders) {
        bone = 12;
      } else if (picked.shape == leftFoot) {
        bone = 13;
        println(bone);
      } else if (picked.shape == rightFoot) {
        bone = 14;
        println(bone);
      }
    } else if (picked == null){
      mouseClicked = false;
    }
  }
  
 
 //=======================================================================
 //ANIMATION MATRICIES
 //=======================================================================
  //affects the entire skeleton as is is before any object is drawn
  translate(sideways, 0, forward);
  translate(0, -200, 0);
  
  //full body rotation
  rotateY(moveLeftSpine);
  
  //full body/spinal translations
  pushMatrix();
    rotateY(rotHips);
    pushMatrix();
      translate(0, 100, 0);
      rotateX(leanHips);
      rotateZ(leanBackHips);
      translate(0, -100, 0);
      spine.draw(getGraphics());
      
      translate(0, -80, 0);
      shoulders.draw(getGraphics());
    popMatrix();
  popMatrix();
  translate(0, 100, 0);
  //rotateY(rotHips);
  hips.draw(getGraphics());
  
  //moves head into position
  translate(15, -220, 0);
 
  //starts matrix for the head
  pushMatrix();
    //translations for the head (needs work)
    rotateY(rotHips);
    translate(-15, 220, 0);
    rotateX(leanHips);
    
    rotateZ(leanBackHips);
    translate(15, -220, 0);
    pushMatrix();
    rotateX(turnHead);
    rotateY(moveLeftHead);
    rotateZ(moveUpHead);
    head.draw(getGraphics());
    translate(20, -5, 12);
    leftEye.draw(getGraphics());
    translate(0, 0, -24);
    rightEye.draw(getGraphics());
    popMatrix();
  popMatrix();
  
  
  //arms--------------------------------------------------------
  translate(-15, 0, 0);
  pushMatrix();
    rotateY(rotHips);
    translate(0, 40, 47);
    translate(0, 180, -47);
    rotateX(leanHips);
    rotateZ(leanBackHips);
    translate(0, -180, 47);
    
    //translations for left arm
    pushMatrix();
      rotateX(moveLeftLUA);
      rotateY(moveLeftLLA); //because when you try to move your lower arm, you must turn your upper arm
      rotateZ(moveUpLUA);
      translate(0, 50, 0); //moves the rotation point of the limb away from center
      leftUpArm.draw(getGraphics());
      pushMatrix();
        translate(0, 50, 0);
        rotateY(turnLLA);
        rotateZ(moveUpLLA);
        translate(0, 40, 0); //moves the rotation point of the limb away from center
        leftLowArm.draw(getGraphics());
      popMatrix();
    popMatrix();
    
    
    translate(0, 0, -94);
    //translations for right arm
    pushMatrix();
      rotateX(moveLeftRUA);
      rotateY(moveLeftRLA);
      rotateZ(moveUpRUA);
      translate(0, 50, 0); //moves the rotation point of the limb away from center
      rightUpArm.draw(getGraphics());
      pushMatrix();
        translate(0, 50, 0);
        rotateY(turnRLA);
        rotateZ(moveUpRLA);
        translate(0, 40, 0); //moves the rotation point of the limb away from center
        rightLowArm.draw(getGraphics());
      popMatrix();
    popMatrix();
  popMatrix();
  
  //legs--------------------------------------------------------
  //translations for left leg
  translate(0, 40, -47);
  translate(0, 180, 85);
  pushMatrix();
    rotateX(moveLeftLUL);
    rotateY(moveLeftLLL);
    rotateZ(moveUpLUL);
    translate(0, 40, 0);
    leftUpLeg.draw(getGraphics());
    pushMatrix();
      translate(0, 40, 0);
      rotateZ(moveUpLLL);
      translate(0, 50, 0);
      leftLowLeg.draw(getGraphics());
      pushMatrix();
        translate(0, 50, 0);
        rotateZ(moveUpLF);
        rotateY(moveLeftLF);
        translate(15, 0, 0);
        leftFoot.draw(getGraphics());
      popMatrix();
    popMatrix();
  popMatrix();
  
  //translations for right leg
  translate(0, 0, -76);
  pushMatrix();
    rotateX(moveLeftRUL);
    rotateY(moveLeftRLL);
    rotateZ(moveUpRUL);
    translate(0, 40, 0);
    rightUpLeg.draw(getGraphics());
    pushMatrix();
      translate(0, 40, 0);
      rotateZ(moveUpRLL);
      translate(0, 50, 0);
      rightLowLeg.draw(getGraphics());
      pushMatrix();
        translate(0, 50, 0);
        rotateZ(moveUpRF);
        rotateY(moveLeftRF);
        translate(15, 0, 0);
        rightFoot.draw(getGraphics());
      popMatrix();
    popMatrix();
  popMatrix();
  
  popMatrix();
  
} 


//=======================================================================
//CONTROLS AND CONSTRAINTS
//=======================================================================
void keyPressedIsCheckedContinuusly() {

  if (keyPressed) {
    if ((key == 'q')||(key == 'Q')){
      if (bone == 1){ //bone 1 is spine
        //moveLeftSpine -= 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        if (turnHead > -0.79){ 
          turnHead -= 0.01;
          println("headtilt: " + turnHead);
        }
      }

      
    } else if ((key == 'e')||(key == 'E')){
      if (bone == 1){ //bone 1 is spine
        //moveLeftSpine -= 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        if (turnHead < 0.79){ 
          turnHead += 0.01;
          println("headtilt: " + turnHead);
        }
      }

        
    //------------------------------------------------------------------
    //Moves Joints Left
    //------------------------------------------------------------------
    } else if ((key == 'a')||(key == 'A')){
      if (bone == 1){ //bone 1 is spine
        moveLeftSpine -= 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        if (moveLeftHead > -1.38){
          moveLeftHead -= 0.01;  
        }      
      }
      
      //arms--------------------------------------------------------
      else if (bone == 3){ //bone 3 is left upper arm
        if(moveUpLUA > -1.4){  
          if (moveLeftLUA < 1.57){
            moveLeftLUA += 0.01;
          }
        } else if (moveUpLUA < -1.4){
          if (moveLeftLUA > -1.57){
             moveLeftLUA -= 0.01;
          }
        }
      }
      else if (bone == 4){ //bone 4 is left lower arm
          if (moveLeftLLA > -0.78){
            moveLeftLLA -= 0.01;
          }
      }
      else if (bone == 5){ //bone 5 is left upper arm
        if(moveUpRUA > -1.4){  
          if (moveLeftRUA < 0.32){
             moveLeftRUA += 0.01;
          }
        } else if (moveUpRUA < -1.4){
          if (moveLeftRUA > -0.32){
            moveLeftRUA -= 0.01;
          } 
        }
      }
      else if (bone == 6){ //bone 6 is right lower arm
        if (moveLeftRLA > -1.13){
          moveLeftRLA -= 0.01;
        }
      }
      
      //legs--------------------------------------------------------
      else if (bone == 7){ //bone 7 is left upper leg
        if (moveLeftLUL < 0.69){
          moveLeftLUL += 0.01;
          //println("lul:" + moveLeftLUL);
        }
      }
      else if (bone == 8){ //bone 8 is left lower leg
        if (moveLeftLLL > -0.69){
          moveLeftLLL -= 0.01;
          //println("lll:" + moveLeftLLL);
        }
      }
      else if (bone == 9){ //bone 9 is right upper leg
        if (moveLeftRUL < 0.26){
          moveLeftRUL += 0.01;
          //println("rul:" + moveLeftRUL);
        }
      }
      else if (bone == 10){ //bone 10 is right lower leg
        if (moveLeftRLL > -0.26){
          moveLeftRLL -= 0.01;
          //println("rll:" + moveLeftRLL);
        }
      }
      else if (bone == 11){
        if (leanHips > -0.53){
          leanHips -= 0.01;
        }
      }
      else if (bone == 12){
        if (leanBackHips < 0){
          if (rotHips < 0.78){
            rotHips += 0.01;
          }
        } else if (leanBackHips >= 0){
          if (rotHips > -0.78){
            rotHips -= 0.01;
          }
        }
      }
      else if (bone == 13){
        if (moveLeftLF > -0.53){
          moveLeftLF -= 0.01;
          println(moveLeftLF);
        }
      }
      else if (bone == 14){
        if (moveLeftRF > -0.53){
          moveLeftRF -= 0.01;
          println(moveLeftRF);
        }
      }
      
    //------------------------------------------------------------------
    //Moves Joints Right
    //------------------------------------------------------------------
    } else if ((key == 'd')||(key == 'D')){
      if (bone == 1){ //bone 1 is spine
        moveLeftSpine += 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        if (moveLeftHead < 1.38){
          moveLeftHead += 0.01;  
        }
      }
      
      //arms--------------------------------------------------------
      else if (bone == 3){ //bone 3 is left upper arm
        if(moveUpLUA > -1.4){  
          if (moveLeftLUA > -0.32){
             moveLeftLUA -= 0.01;
          }
        } else if (moveUpLUA < -1.4){
          if (moveLeftLUA < 0.32){
            moveLeftLUA += 0.01;
          } 
        }     
      }
      else if (bone == 4){ //bone 4 is left lower arm
          if (moveLeftLLA < 1.13){
            moveLeftLLA += 0.01;
          }
      }
      else if (bone == 5){ //bone 5 is right upper arm
        if(moveUpRUA > -1.4){  
          if (moveLeftRUA > -1.57){
             moveLeftRUA -= 0.01;
          }
        } else if (moveUpRUA < -1.4){
          if (moveLeftRUA < 1.57){
            moveLeftRUA += 0.01;
          } 
        }
      }
      else if (bone == 6){ //bone 6 is right lower arm
        if (moveLeftRLA < 0.78){
            moveLeftRLA += 0.01;
          }  
      }
      
      //legs--------------------------------------------------------
      else if (bone == 7){ //bone 7 is left upper leg
        if (moveLeftLUL > -0.26){
          moveLeftLUL -= 0.01;
          //println("lul:" + moveLeftLUL);
        }
      }
      else if (bone == 8){ //bone 8 is left lower leg
        if (moveLeftLLL < 0.26){
          moveLeftLLL += 0.01;
          //println("lll:" + moveLeftLLL);
        }
      }
      else if (bone == 9){ //bone 9 is right upper leg
        if (moveLeftRUL > -0.69){
          moveLeftRUL -= 0.01;
          //println("rul:" + moveLeftRUL);
        }
      }
      else if (bone == 10){ //bone 10 is right lower leg
        if (moveLeftRLL < 0.69){
          moveLeftRLL += 0.01;
          //println("rll:" + moveLeftRLL);
        }
      }
      else if (bone == 11){
        if (leanHips < 0.53){
          leanHips += 0.01;
        }
      }
      else if (bone == 12){
        if (leanBackHips >= 0){
          if (rotHips < 0.78){
            rotHips += 0.01;
          }
        } else if (leanBackHips < 0){
          if (rotHips > -0.78){
            rotHips -= 0.01;
        }
      }
      }
      else if (bone == 13){
        if (moveLeftLF < 0.53){
          moveLeftLF += 0.01;
          println(moveLeftLF);
        }
      }
      else if (bone == 14){
        if (moveLeftRF < 0.53){
          moveLeftRF += 0.01;
          println(moveLeftRF);
        }
      }

      
    //------------------------------------------------------------------
    //Moves Joints Up
    //------------------------------------------------------------------
    } else if ((key == 'w')||(key == 'W')){
      if (bone == 1){ //bone 1 is spine
        moveUpSpine -= 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        if (moveUpHead > -1.3){
          moveUpHead -= 0.01;
        }
      }
      
      //arms--------------------------------------------------------
      else if (bone == 3){ //bone 3 is left upper arm
        if (moveUpLUA > -2.8){
          moveUpLUA -= 0.01;
        }      
      }
      else if (bone == 4){ //bone 4 is left lower arm
        if (moveUpLLA > -2.62){
          moveUpLLA -= 0.01;
        }
      }
      else if (bone == 5){ //bone 5 is right upper arm
        if (moveUpRUA > -2.8){
          moveUpRUA -= 0.01;
        }       
      }
      else if (bone == 6){ //bone 6 is right lower arm
        if (moveUpRLA > -2.62){
          moveUpRLA -= 0.01;
        }       
      }
      
      //legs--------------------------------------------------------
      else if (bone == 7){ //bone 7 is left upper leg
        if (moveUpLUL > -1.74){
          moveUpLUL -= 0.01;      
          //println("lul:" + moveUpLUL);
        }
      }
      else if (bone == 8){ //bone 8 is left lower leg
        if (moveUpLLL > 0){
          moveUpLLL -= 0.01;
          //println("lll:" + moveUpLLL);
        }
      }
      else if (bone == 9){ //bone 9 is right upper leg
        if (moveUpRUL > -1.74){
          moveUpRUL -= 0.01;
          //println("rul:" + moveUpRUL);
        }
      }
      else if (bone == 10){ //bone 10 is right lower leg
        if (moveUpRLL > 0){
          moveUpRLL -= 0.01;    
          //println("rll:" + moveUpRLL);
        }
      }
      else if (bone == 11){
        if (leanBackHips < 0.53){
          leanBackHips += 0.01;
          println(leanBackHips);
        }
      }
      else if (bone == 13){
        if (moveUpLF > -0.17){
          moveUpLF -= 0.01;
          println(moveUpLF);
        }
      }
      else if (bone == 14){
        if (moveUpRF > -0.17){
          moveUpRF -= 0.01;
          println(moveUpRF);
        }
      }


      
    //------------------------------------------------------------------
    //Moves Joints Down
    //------------------------------------------------------------------
    } else if ((key == 's')||(key == 'S')){
      if (bone == 1){ //bone 1 is spine
        moveUpSpine += 0.01;       
      }
      else if (bone == 2){ //bone 2 is head
        if (moveUpHead < 1.25){
          moveUpHead += 0.01;
        }
      }
      //arms--------------------------------------------------------
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
        if (moveUpRUA < 0.79){
          moveUpRUA += 0.01;
        }        
      }
      else if (bone == 6){ //bone 6 is right lower arm
        if (moveUpRLA < 0.01){
          moveUpRLA += 0.01;
        }      
      }
      
      //legs--------------------------------------------------------
      else if (bone == 7){ //bone 7 is left upper leg
        if (moveUpLUL < 0.69){
          moveUpLUL += 0.01;   
          //println("lul:" + moveUpLUL);
        }
      }
      else if (bone == 8){ //bone 8 is left lower leg
        if (moveUpLLL < 2.5){
          moveUpLLL += 0.01;
          //println("lll:" + moveUpLLL);
        }
      }
      else if (bone == 9){ //bone 9 is right upper leg
        if (moveUpRUL < 0.69){
          moveUpRUL += 0.01;
          //println("rul:" + moveUpRUL);
        }
      }
      else if (bone == 10){ //bone 10 is right lower leg
        if (moveUpRLL < 2.5){
          moveUpRLL += 0.01;   
          //println("rll:" + moveUpRLL);
        }
      }
      else if (bone == 11){
        if (leanBackHips > -0.53){
          leanBackHips -= 0.01;
          //println(leanBackHips);
        }
      }
      else if (bone == 13){
        if (moveUpLF < 1){
          moveUpLF += 0.01;
          println(moveUpLF);
        }
      }
      else if (bone == 14){
        if (moveUpRF < 1){
          moveUpRF += 0.01;
          println(moveUpRF);
        }
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
