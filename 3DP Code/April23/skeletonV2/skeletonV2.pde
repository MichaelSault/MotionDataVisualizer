//=========================================================================
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
//=========================================================================


import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

//tranformation vars for X-axis
float moveX = 0.0;
float hipsX = 0.0;
float spineX = 0.0;
float spine1X = 0.0;
float leftShoulderX = 0.0;
float leftUpArmX = 0.0;
float leftLowArmX = 0.0;
float leftHandX = 0.0;
float leftThumbX = 0.0;
float rightShoulderX = 0.0;
float rightUpArmX = 0.0;
float rightLowArmX = 0.0;
float rightHandX = 0.0;
float rightThumbX = 0.0;
float leftUpLegX = 0.0;
float leftLowLegX = 0.0;
float leftFootX = 0.0;
float leftToeX = 0.0;
float rightUpLegX = 0.0;
float rightLowLegX = 0.0;
float rightFootX = 0.0;
float rightToeX = 0.0;
float neckX = 0.0;
float headX = 0.0;


//tranformation vars for Y-axis
float moveY = 0.0;
float hipsY = 0.0;
float spineY = 0.0;
float spine1Y = 0.0;
float leftShoulderY = 0.0;
float leftUpArmY = 0.0;
float leftLowArmY = 0.0;
float leftHandY = 0.0;
float leftThumbY = 0.0;
float rightShoulderY = 0.0;
float rightUpArmY = 0.0;
float rightLowArmY = 0.0;
float rightHandY = 0.0;
float rightThumbY = 0.0;
float leftUpLegY = 0.0;
float leftLowLegY = 0.0;
float leftFootY = 0.0;
float leftToeY = 0.0;
float rightUpLegY = 0.0;
float rightLowLegY = 0.0;
float rightFootY = 0.0;
float rightToeY = 0.0;
float neckY = 0.0;
float headY = 0.0;


//tranformation vars for Z-axis
float moveZ = 0.0;
float hipsZ = 0.0;
float spineZ = 0.0;
float spine1Z = 0.0;
float leftShoulderZ = 0.0;
float leftUpArmZ = 0.0;
float leftLowArmZ = 0.0;
float leftHandZ = 0.0;
float leftThumbZ = 0.0;
float rightShoulderZ = 0.0;
float rightUpArmZ = 0.0;
float rightLowArmZ = 0.0;
float rightHandZ = 0.0;
float rightThumbZ = 0.0;
float leftUpLegZ = 0.0;
float leftLowLegZ = 0.0;
float leftFootZ = 0.0;
float leftToeZ = 0.0;
float rightUpLegZ = 0.0;
float rightLowLegZ = 0.0;
float rightFootZ = 0.0;
float rightToeZ = 0.0;
float neckZ = 0.0;
float headZ = 0.0;

//frame counter
int frame = 0;

//camera vars
float cameraWidth = -1000.0;
float cameraDepth = -700.0;
float cameraHeight = 0.0;

float rotCamX = 0.0;
float rotCamY = 0.0;

//vars used to parse bvh
String[] test;
String[] translate;

int start = 0;
int frameNum;
String[] [] moveArray = new String[frameNum][78];

//selecting the mo cap file
String fileName;
String ffName;
boolean setUpDone = false;
boolean firstRun = false;

boolean showData = false;
boolean showInstructions = true;
//------------------------------------------
//Root Bone
//------------------------------------------
Box hips;

//------------------------------------------
//Spine
//------------------------------------------
Box spine;
Box spine1;

//------------------------------------------
//Left Arm
//------------------------------------------
Box leftShoulder;
Box leftUpArm;
Box leftLowArm;
Box leftHand;
Box leftThumb;

//------------------------------------------
//Right Arm
//------------------------------------------
Box rightShoulder;
Box rightUpArm;
Box rightLowArm;
Box rightHand;
Box rightThumb;

//------------------------------------------
//Left Leg
//------------------------------------------
Box leftUpLeg;
Box leftLowLeg;
Box leftFoot;
Box leftToe;

//------------------------------------------
//Left Leg
//------------------------------------------
Box rightUpLeg;
Box rightLowLeg;
Box rightFoot;
Box rightToe;

//------------------------------------------
//Head
//------------------------------------------
Box neck;
Ellipsoid head;
//to better visualize the head movement
Ellipsoid leftEye;
Ellipsoid rightEye;

Picked picked = null;

Box floor;



//set up function defines the defaults of the shapes/canvas
void setup() {
  fullScreen(P3D);
  noFill();
  
  hips = new Box(73, 15, 10);
  hips.fill(randomColor());
  
  spine = new Box(10, 102.5, 10);
  spine.fill(randomColor());
  
  spine1 = new Box(10, 78.3, 10);
  spine1.fill(randomColor());
  
  leftShoulder = new Box(-67.1, 15, 10);
  leftShoulder.fill(randomColor());
  
  rightShoulder = new Box(67.1, 15, 10);
  rightShoulder.fill(randomColor());
  
  
  //define left arm
  leftUpArm = new Box(-109.4, 10, 10);
  leftUpArm.fill(randomColor());
  leftLowArm = new Box(-85.2, 10, 10);
  leftLowArm.fill(randomColor());
  leftHand = new Box(39.4, 10, 10);
  leftHand.fill(randomColor());
  leftThumb = new Box(10, 10, 25);
  leftThumb.fill(randomColor());
  
  //define right arm
  rightUpArm = new Box(109.4, 10, 10);
  rightUpArm.fill(randomColor());
  rightLowArm = new Box(85.2, 10, 10);
  rightLowArm.fill(randomColor());
  rightHand = new Box(39.4, 10, 10);
  rightHand.fill(randomColor());
  rightThumb = new Box(10, 10, 25);
  rightThumb.fill(randomColor());
  
  //define left leg
  leftUpLeg = new Box(10, -157.1, 10);
  leftUpLeg.fill(randomColor());
  leftLowLeg = new Box(10, -154.2, 10);
  leftLowLeg.fill(randomColor()); 
  
  //define right leg
  rightUpLeg = new Box(10, -157.1, 10);
  rightUpLeg.fill(randomColor());
  rightLowLeg = new Box(10, -154.2, 10);
  rightLowLeg.fill(randomColor());
  
  //define left foot
  leftFoot = new Box(20, 59.3, 10);
  leftFoot.fill(randomColor());
  leftToe = new Box(20, 10, 29.5);
  leftToe.fill(randomColor());
  
  //define right foot
  rightFoot = new Box(20, 59.3, 10);
  rightFoot.fill(randomColor());
  rightToe = new Box(20, 10, 29.5);
  rightToe.fill(randomColor());
  
  //define the head
  neck = new Box(10, 69.1, 10);
  neck.fill(randomColor());
  head = new Ellipsoid(40, 30, 30);
  head.fill(randomColor());
  leftEye =  new Ellipsoid(10, 15, 5);
  int eyes = randomColor(); //makes both eyes the same colour
  leftEye.fill(eyes);
  rightEye =  new Ellipsoid(10, 15, 5);
  rightEye.fill(eyes);
  
  //define floor
  floor = new Box(5000, 1, 1500);
  
  selectInput("Select a file to process:", "fileSelected"); //promts user to select a motion file

}


//draws the shapes and applies the transformations/translations
void draw() {
  background(0);
  
  if (setUpDone == true){  //checks if a .bvh file is selected
    
    if (firstRun == true){  //on first iteration, sets moveArray;
      //=======================================================================
      //PARSE BVH FILE
      //=======================================================================
        test = loadStrings(fileName); //change file name to play different animations
       
       String[] fName = split(fileName, '\\');
       ffName = fName[fName.length-1];
       println(ffName);
        //finds the start of the motion data, dumps it into a list
        //also finds the number of frames in the animation
        for (int i = 0; i < test.length; i++) {
         if (test[i].equals("MOTION")){
           start = i + 3;
           String [] frames = split(test[i+1], ' ');
           frameNum = int(frames[1]);
           break;
         }
        }
  
        moveArray = new String[frameNum][78];
        
        //splits the motion data by bone and stores it in the move array for later use
        for (int k = 0; k < (test.length)-start; k++){
          translate = split(test[start+k], ' ');
          int tranSize = 78;
          for (int j = 0; j < tranSize; j++){
            moveArray[k][j] = translate[j];
          }
        }
        firstRun = false;
    }
    
    getNextFrame();  //finds the next values for animation matrix
    keyPressedIsCheckedContinuusly();  //pulls values for the camera movement
    
    
  
  
  //=======================================================================
  //ANIMATION MATRICIES
  //=======================================================================
    pushMatrix();
      translate(width + cameraWidth, height + cameraHeight, cameraDepth);
      //affects the entire skeleton as is is before any object is drawn
      rotateX(rotCamX);
      rotateY(rotCamY + 3.14159);
      floor.draw(getGraphics());
    
      //------------------------------------------
      //Spine --> Head
      //------------------------------------------
      pushMatrix();
        translate(-moveX*10, -moveY*10, -moveZ*10);
        rotateX(radians(hipsX));
        rotateY(radians(hipsY));
        rotateZ(radians(hipsZ));
        hips.draw(getGraphics());
        pushMatrix();
          translate(0, -7.5, 0);
          rotateX(radians(spineX));
          rotateY(radians(spineY));
          rotateZ(radians(spineZ));
          translate(0, -51.25, 0);
          spine.draw(getGraphics());
          pushMatrix();
            translate(0, -51.25, 0);
            rotateX(radians(spine1X));
            rotateY(radians(spine1Y));
            rotateZ(radians(spine1Z));
            translate(0, -39.15, 0);
            spine1.draw(getGraphics());
            pushMatrix();
              translate(0, -39.15, 0);
              rotateX(radians(neckX));
              rotateY(radians(neckY));
              rotateZ(radians(neckZ));
              translate(0, -34.55, 0);
              neck.draw(getGraphics());
              pushMatrix();
                translate(0, -34.55, 0);
                rotateX(radians(headX));
                rotateY(radians(headY));
                rotateZ(radians(headZ));
                head.draw(getGraphics());
                translate(15, -5, -30);
                leftEye.draw(getGraphics());
                translate(-30, 0, 0);
                rightEye.draw(getGraphics());
              popMatrix();
            popMatrix();
            
            
      //------------------------------------------
      //Left Arm
      //------------------------------------------
            pushMatrix();
              translate(-5, -39.15, 0);
              rotateX(radians(leftShoulderX));
              rotateY(radians(leftShoulderY));
              rotateZ(radians(leftShoulderZ));
              translate(-33.55, 0, 0);
              leftShoulder.draw(getGraphics());
              pushMatrix();
                translate(-33.55, 0, 0);
                rotateX(radians(leftUpArmX));
                rotateY(radians(leftUpArmY));
                rotateZ(radians(leftUpArmZ));
                translate(-54.7, 0, 0);
                leftUpArm.draw(getGraphics());
                pushMatrix();
                  translate(-54.7, 0, 0);
                  rotateX(radians(leftLowArmX));
                  rotateY(radians(leftLowArmY));
                  rotateZ(radians(leftLowArmZ));
                  translate(-42.6, 0, 0);
                  leftLowArm.draw(getGraphics());
                  pushMatrix();
                    translate(-42.6, 0, 0);
                    rotateX(radians(leftHandX));
                    rotateY(radians(leftHandY));
                    rotateZ(radians(leftHandZ));
                    translate(-19.75, 0, 0);
                    leftHand.draw(getGraphics());
                  popMatrix();
                  pushMatrix();
                    translate(-42.6, 0, -2.5);
                    rotateX(radians(leftThumbX));
                    rotateY(radians(leftThumbY));
                    rotateZ(radians(leftThumbZ));
                    translate(0, 0, -12.5);
                    leftThumb.draw(getGraphics());
                  popMatrix();
                popMatrix();
              popMatrix();
            popMatrix();
            
            
      //------------------------------------------
      //Right Arm
      //------------------------------------------
            pushMatrix();
              translate(5, -39.15, 0);
              rotateX(radians(rightShoulderX));
              rotateY(radians(rightShoulderY));
              rotateZ(radians(rightShoulderZ));
              translate(33.55, 0, 0);
              rightShoulder.draw(getGraphics());
              pushMatrix();
                translate(33.55, 0, 0);
                rotateX(radians(rightUpArmX));
                rotateY(radians(rightUpArmY));
                rotateZ(radians(rightUpArmZ));
                translate(54.7, 0, 0);
                rightUpArm.draw(getGraphics());
                pushMatrix();
                  translate(54.7, 0, 0);
                  rotateX(radians(rightLowArmX));
                  rotateY(radians(rightLowArmY));
                  rotateZ(radians(rightLowArmZ));
                  translate(42.6, 0, 0);
                  rightLowArm.draw(getGraphics());
                  pushMatrix();
                    translate(42.6, 0, 0);
                    rotateX(radians(rightHandX));
                    rotateY(radians(rightHandY));
                    rotateZ(radians(rightHandZ));
                    translate(19.75, 0, 0);
                    rightHand.draw(getGraphics());
                  popMatrix();
                  pushMatrix();
                    translate(42.6, 0, -2.5);
                    rotateX(radians(rightThumbX));
                    rotateY(radians(rightThumbY));
                    rotateZ(radians(rightThumbZ));
                    translate(0, 0, -12.5);
                    rightThumb.draw(getGraphics());
                  popMatrix();
                popMatrix();
              popMatrix();
            popMatrix();  
          popMatrix();
        popMatrix();
      
      
      //------------------------------------------
      //Left Leg
      //------------------------------------------ 
        pushMatrix();
          translate(-36.5, 0, 0);
          translate(0, 7.5, 0);
          rotateX(radians(leftUpLegX));
          rotateY(radians(leftUpLegY));
          rotateZ(radians(leftUpLegZ));
          translate(0, 78.55, 0);
          leftUpLeg.draw(getGraphics());
          pushMatrix();
            translate(0, 78.55, 0);
            rotateX(radians(leftLowLegX));
            rotateY(radians(leftLowLegY));
            rotateZ(radians(leftLowLegZ));
            translate(0, 77.1, 0);
            leftLowLeg.draw(getGraphics());
            pushMatrix();
              translate(0, 77.1, 0);
              rotateX(radians(leftFootX));
              rotateY(radians(leftFootY));
              rotateZ(radians(leftFootZ));
              rotateX(-1.309);
              translate(0, 29.65, 0);
              leftFoot.draw(getGraphics());
            popMatrix();
          popMatrix();
        popMatrix();
              
              
      //------------------------------------------
      //Right Leg
      //------------------------------------------   
        pushMatrix();
          translate(36.5, 0, 0);
          translate(0, 7.5, 0);
          rotateX(radians(rightUpLegX));
          rotateY(radians(rightUpLegY));
          rotateZ(radians(rightUpLegZ));
          translate(0, 78.55, 0);
          rightUpLeg.draw(getGraphics());
          pushMatrix();
            translate(0, 78.55, 0);
            rotateX(radians(rightLowLegX));
            rotateY(radians(rightLowLegY));
            rotateZ(radians(rightLowLegZ));
            translate(0, 77.1, 0);
            rightLowLeg.draw(getGraphics());
            pushMatrix();
              translate(0, 77.1, 0);
              rotateX(radians(rightFootX));
              rotateY(radians(rightFootY));
              rotateZ(radians(rightFootZ));
              rotateX(-1.309);
              translate(0, 29.65, 0);
              rightFoot.draw(getGraphics());
            popMatrix();
          popMatrix();
        popMatrix();
      popMatrix();
    popMatrix(); //closes the one way up top
  }
} 

//=======================================================================
//CONTROLS AND CONSTRAINTS
//=======================================================================
void getNextFrame() {
  moveX = float(moveArray[frame][1]);
  moveY = float(moveArray[frame][2]);
  moveZ = float(moveArray[frame][3]);
  
  hipsX = float(moveArray[frame][4]);
  hipsY = float(moveArray[frame][5]);
  hipsZ = float(moveArray[frame][6]);
  
  leftUpLegX = float(moveArray[frame][7]);
  leftUpLegY = float(moveArray[frame][8]);
  leftUpLegZ = float(moveArray[frame][9]);
   
  leftLowLegX = float(moveArray[frame][10]);
  leftLowLegY = float(moveArray[frame][11]);
  leftLowLegZ = float(moveArray[frame][12]);
   
  leftFootX = float(moveArray[frame][13]);
  leftFootY = float(moveArray[frame][14]);
  leftFootZ = float(moveArray[frame][15]);
   
  leftToeX = float(moveArray[frame][16]);
  leftToeY = float(moveArray[frame][17]);
  leftToeZ = float(moveArray[frame][18]);
   
  rightUpLegX = float(moveArray[frame][19]);
  rightUpLegY = float(moveArray[frame][20]);
  rightUpLegZ = float(moveArray[frame][21]);
   
  rightLowLegX = float(moveArray[frame][22]);
  rightLowLegY = float(moveArray[frame][23]);
  rightLowLegZ = float(moveArray[frame][24]);
   
  rightFootX = float(moveArray[frame][25]);
  rightFootY = float(moveArray[frame][26]);
  rightFootZ = float(moveArray[frame][27]);
   
  rightToeX = float(moveArray[frame][28]);
  rightToeY = float(moveArray[frame][29]);
  rightToeZ = float(moveArray[frame][30]);
   
  spineX = float(moveArray[frame][31]);
  spineY = float(moveArray[frame][32]);
  spineZ = float(moveArray[frame][33]);
   
  spine1X = float(moveArray[frame][34]);
  spine1Y = float(moveArray[frame][35]);
  spine1Z = float(moveArray[frame][36]);
   
  neckX = float(moveArray[frame][37]);
  neckY = float(moveArray[frame][38]);
  neckZ = float(moveArray[frame][39]);
   
  headX = float(moveArray[frame][40]);
  headY = float(moveArray[frame][41]);
  headZ = float(moveArray[frame][42]);
  
  leftShoulderX = float(moveArray[frame][43]);
  leftShoulderY = float(moveArray[frame][44]);
  leftShoulderZ = float(moveArray[frame][45]);
  
  leftUpArmX = float(moveArray[frame][46]);
  leftUpArmY = float(moveArray[frame][47]);
  leftUpArmZ = float(moveArray[frame][48]);
  
  leftLowArmX = float(moveArray[frame][49]);
  leftLowArmY = float(moveArray[frame][50]);
  leftLowArmZ = float(moveArray[frame][51]);
  
  leftHandX = float(moveArray[frame][52]);
  leftHandY = float(moveArray[frame][53]);
  leftHandZ = float(moveArray[frame][54]);
  
  leftThumbX = float(moveArray[frame][58]);
  leftThumbY = float(moveArray[frame][59]);
  leftThumbZ = float(moveArray[frame][60]);
  
  rightShoulderX = float(moveArray[frame][61]);
  rightShoulderY = float(moveArray[frame][62]);
  rightShoulderZ = float(moveArray[frame][63]);
  
  rightUpArmX = float(moveArray[frame][64]);
  rightUpArmY = float(moveArray[frame][65]);
  rightUpArmZ = float(moveArray[frame][66]);
  
  rightLowArmX = float(moveArray[frame][67]);
  rightLowArmY = float(moveArray[frame][68]);
  rightLowArmZ = float(moveArray[frame][69]);
  
  rightHandX = float(moveArray[frame][70]);
  rightHandY = float(moveArray[frame][71]);
  rightHandZ = float(moveArray[frame][72]);
  
  rightThumbX = float(moveArray[frame][76]);
  rightThumbY = float(moveArray[frame][77]);
  rightThumbZ = float(moveArray[frame][77]);
  
  
  if (frame < frameNum-1){  //iterate
    frame += 1;  
  } else frame = 0;  //and then loop
  
  if (showData == true){
    textSize(32);
    fill(255,255,255);
    text("File:", 10, 30);
    fill(255,0,0);
    text(ffName, 85, 30);
    fill(255,255,255);
    text("Frame: " + frame + "/" + frameNum, 10, 62);
    text("Hips(Translation): (" + nf(moveX, 0, 2) + ", " + nf(moveY, 0, 2) + ", " + nf(moveZ, 0, 2) + ")", 10, 30+(32*2));
    text("Hips(Rotation): (" + nf(hipsX, 0, 2) + ", " + nf(hipsY, 0, 2) + ", " + nf(hipsZ, 0, 2) + ")", 10, 30+(32*3));
    text("Left Upper Leg: (" + nf(leftUpLegX, 0, 2) + ", " + nf(leftUpLegY, 0, 2) + ", " + nf(leftUpLegZ, 0, 2) + ")", 10, 30+(32*4));
    text("Left Lower Leg: (" + nf(leftLowLegX, 0, 2) + ", " + nf(leftLowLegY, 0, 2) + ", " + nf(leftLowLegZ, 0, 2) + ")", 10, 30+(32*5));
    text("Left Foot: (" + nf(leftFootX, 0, 2) + ", " + nf(leftFootY, 0, 2) + ", " + nf(leftFootZ, 0, 2) + ")", 10, 30+(32*6));
    text("Right Upper Leg: (" + nf(rightUpLegX, 0, 2) + ", " + nf(rightUpLegY, 0, 2) + ", " + nf(rightUpLegZ, 0, 2) + ")", 10, 30+(32*7));
    text("Right Lower Leg: (" + nf(rightLowLegX, 0, 2) + ", " + nf(rightLowLegY, 0, 2) + ", " + nf(rightLowLegZ, 0, 2) + ")", 10, 30+(32*8));
    text("Right Foot: (" + nf(rightFootX, 0, 2) + ", " + nf(rightFootY, 0, 2) + ", " + nf(rightFootZ, 0, 2) + ")", 10, 30+(32*9));
    text("Lower Spine: (" + nf(spineX, 0, 2) + ", " + nf(spineY, 0, 2) + ", " + nf(spineZ, 0, 2) + ")", 10, 30+(32*10));
    text("Upper Spine: (" + nf(spine1X, 0, 2) + ", " + nf(spine1Y, 0, 2) + ", " + nf(spine1Z, 0, 2) + ")", 10, 30+(32*11));
    text("Neck: (" + nf(neckX, 0, 2) + ", " + nf(neckY, 0, 2) + ", " + nf(neckZ, 0, 2) + ")", 10, 30+(32*12));
    text("Head: (" + nf(headX, 0, 2) + ", " + nf(headY, 0, 2) + ", " + nf(headZ, 0, 2) + ")", 10, 30+(32*13));
    text("Left Shoulder: (" + nf(leftShoulderX, 0, 2) + ", " + nf(leftShoulderY, 0, 2) + ", " + nf(leftShoulderZ, 0, 2) + ")", 10, 30+(32*14));
    text("Left Upper Arm: (" + nf(leftUpArmX, 0, 2) + ", " + nf(leftUpArmY, 0, 2) + ", " + nf(leftUpArmZ, 0, 2) + ")", 10, 30+(32*15));
    text("Left Lower Arm: (" + nf(leftLowArmX, 0, 2) + ", " + nf(leftLowArmY, 0, 2) + ", " + nf(leftLowArmZ, 0, 2) + ")", 10, 30+(32*16));
    text("Left Hand: (" + nf(leftHandX, 0, 2) + ", " + nf(leftHandY, 0, 2) + ", " + nf(leftHandZ, 0, 2) + ")", 10, 30+(32*17));
    text("Right Shoulder: (" + nf(rightShoulderX, 0, 2) + ", " + nf(rightShoulderY, 0, 2) + ", " + nf(rightShoulderZ, 0, 2) + ")", 10, 30+(32*18));
    text("Right Upper Arm: (" + nf(rightUpArmX, 0, 2) + ", " + nf(rightUpArmY, 0, 2) + ", " + nf(rightUpArmZ, 0, 2) + ")", 10, 30+(32*19));
    text("Right Lower Arm: (" + nf(rightLowArmX, 0, 2) + ", " + nf(rightLowArmY, 0, 2) + ", " + nf(rightLowArmZ, 0, 2) + ")", 10, 30+(32*20));
    text("Right Hand: (" + nf(rightHandX, 0, 2) + ", " + nf(rightHandY, 0, 2) + ", " + nf(rightHandZ, 0, 2) + ")", 10, 30+(32*21));
  }
  
  if (showInstructions == true){
    textSize(32);
    fill(255,255,255);
    text("Press 1 to hide instructions", 10, 30);
    text("Press 2 to show data", 10, 62);
    text("Press 3 to load a new file", 10, 94);
  }
}
  
//=======================================================================
//CONTROLS AND CONSTRAINTS
//=======================================================================
void keyPressedIsCheckedContinuusly() {
  if (keyPressed) {
    if ((key == 'w')||(key == 'W')){
        cameraDepth += 10;
    }
    if ((key == 's')||(key == 'S')){
        cameraDepth -= 10;
    }
    if ((key == 'a')||(key == 'A')){
        rotCamY += 0.01;
    }
    if ((key == 'd')||(key == 'D')){
        rotCamY -= 0.01;
    }
  }
}

void keyReleased() {
  if (key == '2'){  //toggle the data (frame number, file name, etc)
      if (showData == false){
        showData = true;
        showInstructions = false;
      } else if (showData == true){
        showData = false;
        showInstructions = false;
      }
    }
    if (key == '3'){  //press to load a new file
      selectInput("Select a file to process:", "fileSelected"); //promts user to select a motion file
      firstRun = false;
      setUpDone = false;
    }
    if (key == '1'){  //toggle instructions
      if (showInstructions == false){
        showInstructions = true;
        showData = false;
      } else if (showInstructions == true){
        showInstructions = false;
        showData = false;
      }
    }
}

//=======================================================================
//SELECT RANDOM COLOUR
//=======================================================================
int randomColor(){
  return color(random(0,255), random(0,255), random(0,255));
}


//=======================================================================
//DEFINE THE INPUT FILE PATH
//=======================================================================
void fileSelected(File selection) {
  if (selection == null) {
    //println("Window was closed or the user hit cancel.");
  } else {
    //println("User selected " + selection.getPath());
    fileName = selection.getPath();
    setUpDone = true;
    firstRun = true;
    frame = 0;
  }
}
