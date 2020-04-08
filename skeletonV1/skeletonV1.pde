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

float turnLeftPalm = 1.57;
float turnRightPalm = -1.57;

float up = 0.0;
float turn = 0.0;

float up1 = 0.0;
float turn1 = 0.0;
float forward = 250.0;
float sideways = 0;
boolean mouseClicked = false;

int bone = 1;

float cameraWidth = 0.0;
float cameraDepth = 100;
float cameraHeight = 150;

float rotCamX = 0.0;
float rotCamY = 0.0;

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
Box rightDistalPhalThumb;
Box rightMetacarpalThumb;

Picked picked = null;



//set up function defines the defaults of the shapes/canvas
void setup() {
  fullScreen(P3D);
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
  
  //define the left hand
  //---------------------------------------
  int leftHand = randomColor();
  leftPalm = new Box(5, 25, 15);
  leftPalm.fill(leftHand);
  
  //left Index
  leftProxPhalIndex = new Box(5, 8, 3);
  leftProxPhalIndex.fill(leftHand);
  leftMidPhalIndex = new Box(5, 7, 3);
  leftMidPhalIndex.fill(leftHand);
  leftDistalPhalIndex = new Box(5, 6, 3);
  leftDistalPhalIndex.fill(leftHand);
  
  //left Middle
  leftProxPhalMiddle = new Box(5, 9, 3);
  leftProxPhalMiddle.fill(leftHand);
  leftMidPhalMiddle = new Box(5, 8, 3);
  leftMidPhalMiddle.fill(leftHand);
  leftDistalPhalMiddle = new Box(5, 7, 3);
  leftDistalPhalMiddle.fill(leftHand);
  
  //left Ring
  leftProxPhalRing = new Box(5, 8, 3);
  leftProxPhalRing.fill(leftHand);
  leftMidPhalRing = new Box(5, 7, 3);
  leftMidPhalRing.fill(leftHand);
  leftDistalPhalRing = new Box(5, 6, 3);
  leftDistalPhalRing.fill(leftHand);
  
  //left Pinky
  leftProxPhalPinky = new Box(5, 6, 3);
  leftProxPhalPinky.fill(leftHand);
  leftMidPhalPinky = new Box(5, 6, 3);
  leftMidPhalPinky.fill(leftHand);
  leftDistalPhalPinky = new Box(5, 5, 3);
  leftDistalPhalPinky.fill(leftHand);
  
  //left Thumb
  leftProxPhalThumb = new Box (6, 10, 5);
  leftProxPhalThumb.fill(leftHand);
  leftDistalPhalThumb = new Box (6, 7, 5);
  leftDistalPhalThumb.fill(leftHand);
  leftMetacarpalThumb = new Box (6, 5, 5);
  leftMetacarpalThumb.fill(leftHand);
  
  //define the right hand
  //---------------------------------------
  int rightHand = randomColor();
  rightPalm = new Box(5, 25, 15);
  rightPalm.fill(rightHand);
  
  //right Index
  rightProxPhalIndex = new Box(5, 8, 3);
  rightProxPhalIndex.fill(rightHand);
  rightMidPhalIndex = new Box(5, 7, 3);
  rightMidPhalIndex.fill(rightHand);
  rightDistalPhalIndex = new Box(5, 6, 3);
  rightDistalPhalIndex.fill(rightHand);
  
  //right Middle
  rightProxPhalMiddle = new Box(5, 9, 3);
  rightProxPhalMiddle.fill(rightHand);
  rightMidPhalMiddle = new Box(5, 8, 3);
  rightMidPhalMiddle.fill(rightHand);
  rightDistalPhalMiddle = new Box(5, 7, 3);
  rightDistalPhalMiddle.fill(rightHand);
  
  //right Ring
  rightProxPhalRing = new Box(5, 8, 3);
  rightProxPhalRing.fill(rightHand);
  rightMidPhalRing = new Box(5, 7, 3);
  rightMidPhalRing.fill(rightHand);
  rightDistalPhalRing = new Box(5, 6, 3);
  rightDistalPhalRing.fill(rightHand);
  
  //right Pinky
  rightProxPhalPinky = new Box(5, 6, 3);
  rightProxPhalPinky.fill(rightHand);
  rightMidPhalPinky = new Box(5, 6, 3);
  rightMidPhalPinky.fill(rightHand);
  rightDistalPhalPinky = new Box(5, 5, 3);
  rightDistalPhalPinky.fill(rightHand);
  
  //right Thumb
  rightProxPhalThumb = new Box (6, 10, 5);
  rightProxPhalThumb.fill(rightHand);
  rightDistalPhalThumb = new Box (6, 7, 5);
  rightDistalPhalThumb.fill(rightHand);
  rightMetacarpalThumb = new Box (6, 5, 5);
  rightMetacarpalThumb.fill(rightHand);
}


//draws the shapes and applies the transformations/translations
void draw() {
  background(0);
  keyPressedIsCheckedContinuusly();
  
  
  
  pushMatrix();
  
  translate(width/2 + cameraWidth, height/2+cameraHeight, cameraDepth);
  
  
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
      } else if (picked.shape == rightFoot) {
        bone = 14;
      } else if (picked.shape == leftPalm) {
        bone = 15;
      } else if ((picked.shape == leftProxPhalIndex)||(picked.shape == leftMidPhalIndex)||(picked.shape == leftDistalPhalIndex)) {
        bone = 16;
      } else if ((picked.shape == leftProxPhalMiddle)||(picked.shape == leftMidPhalMiddle)||(picked.shape == leftDistalPhalMiddle)) {
        bone = 17;
      } else if ((picked.shape == leftProxPhalRing)||(picked.shape == leftMidPhalRing)||(picked.shape == leftDistalPhalRing)) {
        bone = 18;
      } else if ((picked.shape == leftProxPhalPinky)||(picked.shape == leftMidPhalPinky)||(picked.shape == leftDistalPhalPinky)) {
        bone = 19;
      } else if ((picked.shape == leftProxPhalThumb)||(picked.shape == leftMetacarpalThumb)||(picked.shape == leftDistalPhalThumb)) {
        bone = 20;
      } else if (picked.shape == rightPalm) {
        bone = 21;
      } else if ((picked.shape == rightProxPhalIndex)||(picked.shape == rightMidPhalIndex)||(picked.shape == rightDistalPhalIndex)) {
        bone = 22;
      } else if ((picked.shape == rightProxPhalMiddle)||(picked.shape == rightMidPhalMiddle)||(picked.shape == rightDistalPhalMiddle)) {
        bone = 23;
      } else if ((picked.shape == rightProxPhalRing)||(picked.shape == rightMidPhalRing)||(picked.shape == rightDistalPhalRing)) {
        bone = 24;
      } else if ((picked.shape == rightProxPhalPinky)||(picked.shape == rightMidPhalPinky)||(picked.shape == rightDistalPhalPinky)) {
        bone = 25;
      } else if ((picked.shape == rightProxPhalThumb)||(picked.shape == rightMetacarpalThumb)||(picked.shape == rightDistalPhalThumb)) {
        bone = 26;
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
  translate(0, -100, 0);
  rotateX(rotCamX);
  rotateY(rotCamY);
  translate(0, -100, 0);
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
        rotateY(turnLeftPalm);
        translate(0, 40, 0); //moves the rotation point of the limb away from center
        leftLowArm.draw(getGraphics());
        pushMatrix();
          translate(0,40,0);
          rotateZ(moveUpLWrist);
          rotateX(moveLeftLWrist);
          translate(0, 10, 0);
          leftPalm.draw(getGraphics());
          translate(0, 10, 6);
          
          
          //Index Finger
          pushMatrix();
            rotateZ(moveUpLIndex);
            rotateX(moveLeftLIndex);
            translate(0,7,0);
            leftProxPhalIndex.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpLIndex*1.5);
            translate(0, 2, 0);
            leftMidPhalIndex.draw(getGraphics());
            translate(0, 5, 0);
            rotateZ(moveUpLIndex/1.5);
            translate(0, 1, 0);
            leftDistalPhalIndex.draw(getGraphics());
          popMatrix();
          translate(0,0,-4);
          
          
          //Middle Finger
          pushMatrix();
            rotateZ(moveUpLMiddle);
            rotateX(moveLeftLMiddle);
            translate(0,7,0);
            leftProxPhalMiddle.draw(getGraphics());
            translate(0, 7, 0);
            rotateZ(moveUpLMiddle*1.5);
            translate(0, 2, 0);
            leftMidPhalMiddle.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpLMiddle/1.5);
            translate(0, 1, 0);
            leftDistalPhalMiddle.draw(getGraphics());
          popMatrix();
          translate(0,0,-4);
          
          
          //Ring Finger
          pushMatrix();
            rotateZ(moveUpLRing);
            rotateX(moveLeftLRing);
            translate(0,7,0);
            leftProxPhalRing.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpLRing*1.5);
            translate(0, 2, 0);
            leftMidPhalRing.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpLRing/1.5);
            translate(0, 1, 0);
            leftDistalPhalRing.draw(getGraphics());
          popMatrix();
          translate(0,0,-4);
          
          
          //Pinky Finger
          pushMatrix();
            rotateZ(moveUpLPinky);
            rotateX(moveLeftLPinky);
            translate(0,7,0);
            leftProxPhalPinky.draw(getGraphics());
            translate(0, 5, 0);
            rotateZ(moveUpLPinky*1.5);
            translate(0, 1, 0);
            leftMidPhalPinky.draw(getGraphics());
            translate(0, 5, 0);
            rotateZ(moveUpLRing/1.5);
            translate(0, 1, 0);
            leftDistalPhalPinky.draw(getGraphics());
          popMatrix();
          
          
          //Thumb
          pushMatrix();
            translate(2,-12, 15);
            translate(moveLeftLThumb, 0, 0);
            rotateY(moveLeftLThumb);
            translate(-moveLeftLThumb, 0, 0);
            rotateZ(moveUpLThumb/3);
            leftProxPhalThumb.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpLThumb);
            translate(0, 2, 0);
            leftDistalPhalThumb.draw(getGraphics());
            translate(0, 5, 0);
            rotateZ(moveUpLThumb);
            translate(0, 2, 0);
            leftMetacarpalThumb.draw(getGraphics());
          popMatrix();
          
        popMatrix();
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
        rotateY(turnRightPalm);
        translate(0, 40, 0); //moves the rotation point of the limb away from center
        rightLowArm.draw(getGraphics());
        pushMatrix();
          translate(0, 40, 0);
          rotateZ(moveUpRWrist);
          rotateX(moveLeftRWrist);
          translate(0, 10, 0);
          rightPalm.draw(getGraphics());
          translate(0, 10, -6);
          
          
          //Index Finger
          pushMatrix();
            rotateZ(moveUpRIndex);
            rotateX(moveLeftRIndex);
            translate(0,7,0);
            rightProxPhalIndex.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpRIndex*1.5);
            translate(0, 2, 0);
            rightMidPhalIndex.draw(getGraphics());
            translate(0, 5, 0);
            rotateZ(moveUpRIndex/1.5);
            translate(0, 1, 0);
            rightDistalPhalIndex.draw(getGraphics());
          popMatrix();
          translate(0,0,4);
          
          
          //Middle Finger
          pushMatrix();
            rotateZ(moveUpRMiddle);
            rotateX(moveLeftRMiddle);
            translate(0,7,0);
            rightProxPhalMiddle.draw(getGraphics());
            translate(0, 7, 0);
            rotateZ(moveUpRMiddle*1.5);
            translate(0, 2, 0);
            rightMidPhalMiddle.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpRMiddle/1.5);
            translate(0, 1, 0);
            rightDistalPhalMiddle.draw(getGraphics());
          popMatrix();
          translate(0,0,4);
          
          
          //Ring Finger
          pushMatrix();
            rotateZ(moveUpRRing);
            rotateX(moveLeftRRing);
            translate(0,7,0);
            rightProxPhalRing.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpRRing*1.5);
            translate(0, 2, 0);
            rightMidPhalRing.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpRRing/1.5);
            translate(0, 1, 0);
            rightDistalPhalRing.draw(getGraphics());
          popMatrix();
          translate(0,0,4);
          
          
          //Pinky Finger
          pushMatrix();
            rotateZ(moveUpRPinky);
            rotateX(moveLeftRPinky);
            translate(0,7,0);
            rightProxPhalPinky.draw(getGraphics());
            translate(0, 5, 0);
            rotateZ(moveUpRPinky*1.5);
            translate(0, 1, 0);
            rightMidPhalPinky.draw(getGraphics());
            translate(0, 5, 0);
            rotateZ(moveUpRRing/1.5);
            translate(0, 1, 0);
            rightDistalPhalPinky.draw(getGraphics());
          popMatrix();
          
          
          //Thumb
          pushMatrix();
            translate(2,-10, -15);
            translate(-moveLeftRThumb, 0, 0);
            rotateY(moveLeftRThumb);
            translate(moveLeftRThumb, 0, 0);
            rotateZ(moveUpRThumb/3);
            rightProxPhalThumb.draw(getGraphics());
            translate(0, 6, 0);
            rotateZ(moveUpRThumb);
            translate(0, 2, 0);
            rightDistalPhalThumb.draw(getGraphics());
            translate(0, 5, 0);
            rotateZ(moveUpRThumb);
            translate(0, 2, 0);
            rightMetacarpalThumb.draw(getGraphics());
          popMatrix();
          
        popMatrix();
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
  println(bone);
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
      } else if ((bone == 0)||(bone == 50)){
        cameraDepth += 1;
      } else if (bone == 15) {
        if (turnLeftPalm > -0.01){
          turnLeftPalm -= 0.01;
        }
      } else if (bone == 21) {
        if (turnRightPalm > -3.14){
          turnRightPalm -= 0.01;
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
      } else if ((bone == 0)||(bone == 50)){
        cameraDepth -= 1;
      } else if (bone == 15) {
        if (turnLeftPalm < 3.14){
          turnLeftPalm += 0.01;
        }
      } else if (bone == 21) {
        if (turnRightPalm < 0.01){
          turnRightPalm += 0.01;
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
      
    //fingers--------------------------------------------------------
     else if (bone == 15){
        if (moveLeftLWrist < 0.15){
          moveLeftLWrist += 0.01;
          println(moveLeftLWrist);
        }
      }
      else if (bone == 16){
        if (moveLeftLIndex < 0.05){
          moveLeftLIndex += 0.01;
          println(moveLeftLIndex);
        }
      }
      else if (bone == 17){
        if (moveLeftLMiddle < 0.05){
          moveLeftLMiddle += 0.01;
          println(moveLeftLMiddle);
        }
      }
      else if (bone == 18){
        if (moveLeftLRing < 0.05){
          moveLeftLRing += 0.01;
          println(moveLeftLRing);
        }
      }
      else if (bone == 19){
        if (moveLeftLPinky < 0.05){
          moveLeftLPinky += 0.01;
          println(moveLeftLPinky);
        }
      }
      else if (bone == 20){
        if (moveLeftLThumb > -0.1){
          moveLeftLThumb -= 0.01;
          println(moveLeftLThumb);
        }
      }
      
      else if (bone == 21){
        if (moveLeftRWrist < 0.79){
          moveLeftRWrist += 0.01;
          println(moveLeftRWrist);
        }
      }
      else if (bone == 22){
        if (moveLeftRIndex < 0.14){
          moveLeftRIndex += 0.01;
          println(moveLeftRIndex);
        }
      }
      else if (bone == 23){
        if (moveLeftRMiddle < 0.18){
          moveLeftRMiddle += 0.01;
          println(moveLeftRMiddle);
        }
      }
      else if (bone == 24){
        if (moveLeftRRing < 0.25){
          moveLeftRRing += 0.01;
          println(moveLeftRRing);
        }
      }
      else if (bone == 25){
        if (moveLeftRPinky < 0.53){
          moveLeftRPinky += 0.01;
          println(moveLeftRPinky);
        }
      }
      else if (bone == 26){
        if (moveLeftRThumb > -2){
          moveLeftRThumb -= 0.01;
          println(moveLeftRThumb);
        }
      }
      
      else if ((bone == 0)||(bone == 50)){
        cameraWidth += 1;
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

    //fingers--------------------------------------------------------
      else if (bone == 15){
        if (moveLeftLWrist > -0.79){
          moveLeftLWrist -= 0.01;
          println(moveLeftLWrist);
        }
      }
      else if (bone == 16){
        if (moveLeftLIndex > -0.14){
          moveLeftLIndex -= 0.01;
          println(moveLeftLIndex);
        }
      }
      else if (bone == 17){
        if (moveLeftLMiddle > -0.18){
          moveLeftLMiddle -= 0.01;
          println(moveLeftLMiddle);
        }
      }
      else if (bone == 18){
        if (moveLeftLRing > -0.25){
          moveLeftLRing -= 0.01;
          println(moveLeftLRing);
        }
      }
      else if (bone == 19){
        if (moveLeftLPinky > -0.53){
          moveLeftLPinky -= 0.01;
          println(moveLeftLPinky);
        }
      }

      else if (bone == 20){
        if (moveLeftLThumb < 2){
          moveLeftLThumb += 0.01;
          println(moveLeftLThumb);
        }
      }
      
      else if (bone == 21){
        if (moveLeftRWrist > -0.15){
          moveLeftRWrist -= 0.01;
          println(moveLeftRWrist);
        }
      }
      else if (bone == 22){
        if (moveLeftRIndex > -0.05){
          moveLeftRIndex -= 0.01;
          println(moveLeftRIndex);
        }
      }
      else if (bone == 23){
        if (moveLeftRMiddle > -0.05){
          moveLeftRMiddle -= 0.01;
          println(moveLeftRMiddle);
        }
      }
      else if (bone == 24){
        if (moveLeftRRing > -0.05){
          moveLeftRRing -= 0.01;
          println(moveLeftRRing);
        }
      }
      else if (bone == 25){
        if (moveLeftRPinky > -0.05){
          moveLeftRPinky -= 0.01;
          println(moveLeftRPinky);
        }
      }
      else if (bone == 26){
        if (moveLeftRThumb < 0.1){
          moveLeftRThumb += 0.01;
        }
      } else if ((bone == 0)||(bone == 50)){
        cameraWidth -= 1;
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
      //fingers--------------------------------------------------------
      else if (bone == 15){
        if (moveUpLWrist > -1.3){
          moveUpLWrist -= 0.01;
          println("moving wrist");
        }
      }
      else if (bone == 16){
        if (moveUpLIndex > -1.57){
          moveUpLIndex -= 0.01;
          println(moveUpLIndex);
        }
      }
      else if (bone == 17){
        if (moveUpLMiddle > -1.57){
          moveUpLMiddle -= 0.01;
          println(moveUpLMiddle);
        }
      }
      else if (bone == 18){
        if (moveUpLRing > -1.57){
          moveUpLRing -= 0.01;
          println(moveUpLRing);
        }
      }
      else if (bone == 19){
        if (moveUpLPinky > -1.57){
          moveUpLPinky -= 0.01;
          println(moveUpLPinky);
        }
      }
      else if (bone == 20){
        if (moveUpLThumb > -0.80){
          moveUpLThumb -= 0.01;
          println(moveUpLThumb);
        }
      }
      
      else if (bone == 21){
        if (moveUpRWrist > -1.3){
          moveUpRWrist -= 0.01;
          println("moving wrist");
        }
      }
      else if (bone == 22){
        if (moveUpRIndex > -1.57){
          moveUpRIndex -= 0.01;
          println(moveUpRIndex);
        }
      }
      else if (bone == 23){
        if (moveUpRMiddle > -1.57){
          moveUpRMiddle -= 0.01;
          println(moveUpRMiddle);
        }
      }
      else if (bone == 24){
        if (moveUpRRing > -1.57){
          moveUpRRing -= 0.01;
          println(moveUpRRing);
        }
      }
      else if (bone == 25){
        if (moveUpRPinky > -1.57){
          moveUpRPinky -= 0.01;
          println(moveUpRPinky);
        }
      }
      else if (bone == 26){
        if (moveUpRThumb > -0.80){
          moveUpRThumb -= 0.01;
          println(moveUpRThumb);
        }
      } else if ((bone == 0)||(bone == 50)){
        cameraHeight += 1;
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
      
      //fingers--------------------------------------------------------
      else if (bone == 15){
        if (moveUpLWrist < 1.4){
          moveUpLWrist += 0.01;
          println(moveUpLWrist);
        }
      }
      else if (bone == 16){
        if (moveUpLIndex < 0.05){
          moveUpLIndex += 0.01;
          println(moveUpLIndex);
        }
      }
      else if (bone == 17){
        if (moveUpLMiddle < 0.05){
          moveUpLMiddle += 0.01;
          println(moveUpLMiddle);
        }
      }
      else if (bone == 18){
        if (moveUpLRing < 0.05){
          moveUpLRing += 0.01;
          println(moveUpLRing);
        }
      }
      else if (bone == 19){
        if (moveUpLPinky < 0.05){
          moveUpLPinky += 0.01;
          println(moveUpLPinky);
        }
      }
      else if (bone == 20){
        if (moveUpLThumb < 0.53){
          moveUpLThumb += 0.01;
          println(moveUpLThumb);
        }
      }
      
      else if (bone == 21){
        if (moveUpRWrist < 1.4){
          moveUpRWrist += 0.01;
          println(moveUpRWrist);
        }
      }
      else if (bone == 22){
        if (moveUpRIndex < 0.05){
          moveUpRIndex += 0.01;
          println(moveUpRIndex);
        }
      }
      else if (bone == 23){
        if (moveUpRMiddle < 0.05){
          moveUpRMiddle += 0.01;
          println(moveUpRMiddle);
        }
      }
      else if (bone == 24){
        if (moveUpRRing < 0.05){
          moveUpRRing += 0.01;
          println(moveUpRRing);
        }
      }
      else if (bone == 25){
        if (moveUpRPinky < 0.05){
          moveUpRPinky += 0.01;
          println(moveUpRPinky);
        }
      }
      else if (bone == 26){
        if (moveUpRThumb < 0.53){
          moveUpRThumb += 0.01;
          println(moveUpRThumb);
        }
      }
      else if ((bone == 0)||(bone == 50)){
        cameraHeight -= 1;
      }

  
//NOTE TO SELF, THIS BRACKET CLOSES THE KEYPICKER FUNCTION
    }else if (key == BACKSPACE){
      if (bone == 15){        //bone 15 is left palm
        if (moveUpLIndex < 0.05){
          moveUpLIndex += 0.01;
        }
        if (moveUpLMiddle < 0.05){
          moveUpLMiddle += 0.01;
        }
        if (moveUpLRing < 0.05){
          moveUpLRing += 0.01;
        }
        if (moveUpLPinky < 0.05){
          moveUpLPinky += 0.01;
        }
        if (moveUpLThumb < 0.05){
          moveUpLThumb += 0.015;
        }
        if (moveLeftLThumb > -0.1){
          moveLeftLThumb -= 0.01;
        }
      } else if (bone == 21){ //bone 21 is right palm
        if (moveUpRIndex < 0.05){
          moveUpRIndex += 0.01;
        }
        if (moveUpRMiddle < 0.05){
          moveUpRMiddle += 0.01;
        }
        if (moveUpRRing < 0.05){
          moveUpRRing += 0.01;
        }
        if (moveUpRPinky < 0.05){
          moveUpRPinky += 0.01;
        }
        if (moveUpRThumb < 0.05){
          moveUpRThumb += 0.015;
        }
        if (moveLeftRThumb < 0.1){
          moveLeftRThumb += 0.01;
        }
      }
    }else if (key == ENTER){
      if (bone == 15){       //bone 15 is left palm
        if (moveUpLIndex > -1.57){
          moveUpLIndex -= 0.01;
        }
        if (moveUpLRing > -1.57){
          moveUpLRing -= 0.01;
        }
        if (moveUpLMiddle > -1.57){
          moveUpLMiddle -= 0.01;
        }
        if (moveUpLPinky > -1.57){
          moveUpLPinky -= 0.01;
        }
        if (moveUpLThumb > -0.80){
          moveUpLThumb -= 0.02;
        }
        if (moveLeftLThumb < 2){
          moveLeftLThumb += 0.01;
        }
      } else if (bone == 21){ //bone 21 is right palm
        if (moveUpRIndex > -1.57){
          moveUpRIndex -= 0.01;
        }
        if (moveUpRMiddle > -1.57){
          moveUpRMiddle -= 0.01;
        }
        if (moveUpRRing > -1.57){
          moveUpRRing -= 0.01;
        }
        if (moveUpRPinky > -1.57){
          moveUpRPinky -= 0.01;
        }
        if (moveUpRThumb > -0.80){
          moveUpRThumb -= 0.015;
        }
        if (moveLeftRThumb > -2){
          moveLeftRThumb -= 0.01;
        }
        
      }
    } else if ((key == 'c')||(key == 'C')){
      if (bone == 0){
        bone = 50;
      } else bone = 0;
      
    } else if ((key == 'z')||(key == 'Z')){
      if (bone == 0){
        rotCamY += 0.01;
      } else if (bone == 50){
        rotCamY -= 0.01;
      }
    } else if ((key == 'x')||(key == 'X')){
      if (bone == 0){
        rotCamX += 0.01;
      } else if (bone == 50){
        rotCamX -= 0.01;
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
