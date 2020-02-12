import ewbik.processing.singlePrecision.*;
import processing.core.PApplet;
import processing.core.PVector;
import processing.event.MouseEvent;
import sceneGraph.math.floatV.SGVec_3f;

import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

Armature simpleArmature;
Bone  rootBone, initialBone, spineBone, headBone,
spineBoneA, spineBoneB, spineBoneC,
upLegBoneL, lowLegBoneL, upLegBoneR, lowLegBoneR,
leftShoulder, rightShoulder, leftUpArm, rightUpArm,
leftLowArm, rightLowArm, leftHand, rightHand,
leftFoot, rightFoot, top;


ArrayList<IKPin> pinnedBones = new ArrayList<IKPin>();
Bone activeBone;
IKPin activePin; 

public void setup() {
    fullScreen(P3D);
    simpleArmature = new Armature("humanoid");
    
    //rotate and translate the armature into the view window.
        simpleArmature.localAxes().translateTo(new SGVec_3f(0, 200, 0));  
        simpleArmature.localAxes().rotateAboutZ(PI, true);
    
    initializeBones(); //create the bones
    setBoneConstraints(); //set some constratints on them
    updatePinList(); //add end effectors (and create a list of them the user can cycle through)
    activeBone = top;
    
}

public void draw() {
    setSceneAndCamera();   

    if(mousePressed) {
        activeBone.setPin(mouse);             
        simpleArmature.IKSolver(
                rootBone, //the bone the solver should start from 
                0.05f, // dampening parameter (in radians), determines the maximum amount a bone can rotate per iteration step. 
                // keeping this value low will result in higher quality poses, but those poses will take more iterations to converge. 
                200, //inverse weighting helps prevent bones near the target from doing all of the work 
                //so  you don't need to rely on small dampening factors mixed with high iteration counts 
                //to get natural looking poses, but it makes armatures with multiple end effectors more unstable. 
                // since this armature has multiple end effectors, we leave this off.
                1 //just leave this set to 1, honestly.
                );
    }
    
    drawInstructions(); 
    drawBones();  
}


public void initializeBones() {
    rootBone = simpleArmature.getRootBone();
    initialBone = new Bone(rootBone, "spine1", 60);
    
    //spine
    spineBoneA = new Bone(initialBone, "spine2", 60);
    spineBoneB = new Bone(spineBoneA, "spine3", 60);
    spineBoneC = new Bone(spineBoneB, "spine4", 60);
    
    //left leg
    upLegBoneL = new Bone(spineBoneC, "upLegBoneL", 90f);
    lowLegBoneL = new Bone(upLegBoneL, "lowLegBoneL", 120f);
    leftFoot = new Bone(lowLegBoneL, "leftFoot", 0f); //not a bone, used to select the end point of the model
    
    //right leg
    upLegBoneR = new Bone(spineBoneC, "upLegBoneR", 90f);
    lowLegBoneR = new Bone(upLegBoneR, "lowLegBoneR", 120f);
    rightFoot = new Bone(lowLegBoneR, "rightFoot", 0f); //not a bone, used to select the end point of the model
    
    //left arm
    leftShoulder = new Bone(initialBone, "leftShoulder", 40f);
    leftUpArm = new Bone(leftShoulder, "leftUpArm", 90f);
    leftLowArm = new Bone(leftUpArm, "leftLowArm", 70f);
    leftHand = new Bone(leftLowArm, "leftHand", 0f); //not a bone, used to select the end point of the model
    
    
    //right arm
    rightShoulder = new Bone(initialBone, "rightShoulder", 40f);
    rightUpArm = new Bone(rightShoulder, "rightUpArm", 90f);
    rightLowArm = new Bone(rightUpArm, "rightLowArm", 70f);
    rightHand = new Bone(rightLowArm, "rightHand", 0f); //not a bone, used to select the end point of the model
    
    //head?
    headBone = new Bone(rootBone, "head", 100);
    top = new Bone(headBone, "top", 0f); //not a bone, used to select the end point of the model
    



    //initialize body
    initialBone.rotAboutFrameX(3f);

    //initialize left leg
    upLegBoneL.rotAboutFrameZ(-.4f);
    lowLegBoneL.rotAboutFrameZ(.4f);
    
    //initialize right leg
    upLegBoneR.rotAboutFrameZ(.4f);
    lowLegBoneR.rotAboutFrameZ(-.4f);
    
    //initalize left arm
    leftShoulder.rotAboutFrameZ(-1f);
    leftUpArm.rotAboutFrameZ(1f);
    leftLowArm.rotAboutFrameZ(-.5f);
    
    //initalize right arm
    rightShoulder.rotAboutFrameZ(1f);
    rightUpArm.rotAboutFrameZ(-1f);
    rightLowArm.rotAboutFrameZ(.5f);
}

public void setBoneConstraints() {    //next step is to set constraints for the bones

    //Kusudama initialConstraint = new Kusudama(initialBone);
    //initialConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //initialConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //initialConstraint.setAxialLimits(0.1f,0.3f);
    //initialConstraint.enable();
    //initialBone.addConstraint(initialConstraint);

    Kusudama spineConstraintA = new Kusudama(spineBoneA);
    spineConstraintA.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    spineConstraintA.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    spineConstraintA.setAxialLimits(0.1f,0.3f);
    spineConstraintA.enable();
    spineBoneA.addConstraint(spineConstraintA);
    
    Kusudama spineConstraintB = new Kusudama(spineBoneB);
    spineConstraintB.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    spineConstraintB.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    spineConstraintB.setAxialLimits(0.1f,0.3f);
    spineConstraintB.enable();
    spineBoneB.addConstraint(spineConstraintB);
    
    Kusudama spineConstraintC = new Kusudama(spineBoneC);
    spineConstraintC.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    spineConstraintC.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    spineConstraintC.setAxialLimits(0.1f,0.3f);
    spineConstraintC.enable();
    spineBoneC.addConstraint(spineConstraintC);
    
    //Kusudama upLegConstraintL = new Kusudama(upLegBoneL);
    //upLegConstraintL.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //upLegConstraintL.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //upLegConstraintL.setAxialLimits(0.1f,0.3f);
    //upLegConstraintL.enable();
    //upLegBoneL.addConstraint(upLegConstraintL);
    
    //Kusudama upLegConstraintR = new Kusudama(upLegBoneR);
    //upLegConstraintR.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //upLegConstraintR.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //upLegConstraintR.setAxialLimits(0.1f,0.3f);
    //upLegConstraintR.enable();
    //upLegBoneR.addConstraint(upLegConstraintR);
    
    //Kusudama lowLegConstraintL = new Kusudama(lowLegBoneL);
    //lowLegConstraintL.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //lowLegConstraintL.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //lowLegConstraintL.setAxialLimits(0.1f,0.3f);
    //lowLegConstraintL.enable();
    //lowLegBoneL.addConstraint(lowLegConstraintL);
    
    //Kusudama lowLegConstraintR = new Kusudama(lowLegBoneR);
    //lowLegConstraintR.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //lowLegConstraintR.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //lowLegConstraintR.setAxialLimits(0.1f,0.3f);
    //lowLegConstraintR.enable();
    //lowLegBoneR.addConstraint(lowLegConstraintR);
    
    //Kusudama lfootConstraint = new Kusudama(leftFoot);
    //lfootConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //lfootConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //lfootConstraint.setAxialLimits(0.1f,0.3f);
    //lfootConstraint.enable();
    //leftFoot.addConstraint(lfootConstraint);
    
    //Kusudama rfootConstraint = new Kusudama(rightFoot);
    //rfootConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //rfootConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //rfootConstraint.setAxialLimits(0.1f,0.3f);
    //rfootConstraint.enable();
    //rightFoot.addConstraint(rfootConstraint);
    
    Kusudama lshoulderConstraint = new Kusudama(leftShoulder);
    lshoulderConstraint.addLimitConeAtIndex(0, new PVector(.5f, .8f, .8f), 1f);
    lshoulderConstraint.addLimitConeAtIndex(1, new PVector(.8f, 1f, 1f), 1f);
    lshoulderConstraint.setAxialLimits(0.1f,0.2f);
    lshoulderConstraint.enable();
    leftShoulder.addConstraint(lshoulderConstraint);
    
    Kusudama rshoulderConstraint = new Kusudama(rightShoulder);
    rshoulderConstraint.addLimitConeAtIndex(0, new PVector(.5f, .8f, .8f), 1f);
    rshoulderConstraint.addLimitConeAtIndex(1, new PVector(.8f, 1f, 1f), 1f);
    rshoulderConstraint.setAxialLimits(0.1f,0.3f);
    rshoulderConstraint.enable();
    rightShoulder.addConstraint(rshoulderConstraint);
    
    //Kusudama luArmConstraint = new Kusudama(leftUpArm);
    //luArmConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //luArmConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //luArmConstraint.setAxialLimits(0.1f,0.3f);
    //luArmConstraint.enable();
    //leftUpArm.addConstraint(luArmConstraint);
    
    //Kusudama ruArmConstraint = new Kusudama(rightUpArm);
    //ruArmConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //ruArmConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //ruArmConstraint.setAxialLimits(0.1f,0.3f);
    //ruArmConstraint.enable();
    //rightUpArm.addConstraint(ruArmConstraint);
    
    //Kusudama lhandConstraint = new Kusudama(leftHand);
    //lhandConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //lhandConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //lhandConstraint.setAxialLimits(0.1f,0.3f);
    //lhandConstraint.enable();
    //leftHand.addConstraint(lhandConstraint);
    
    //Kusudama rhandConstraint = new Kusudama(rightHand);
    //rhandConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //rhandConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //rhandConstraint.setAxialLimits(0.1f,0.3f);
    //rhandConstraint.enable();
    //rightHand.addConstraint(rhandConstraint);
    
    //Kusudama headConstraint = new Kusudama(headBone);
    //headConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //headConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //headConstraint.setAxialLimits(0.1f,0.3f);
    //headConstraint.enable();
    //headBone.addConstraint(headConstraint);
    
    //Kusudama topConstraint = new Kusudama(top);
    //topConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //topConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //topConstraint.setAxialLimits(0.1f,0.3f);
    //topConstraint.enable();
    //top.addConstraint(topConstraint);
    
    //Kusudama llArmConstraint = new Kusudama(leftLowArm);
    //llArmConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //llArmConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //llArmConstraint.setAxialLimits(0.1f,0.3f);
    //llArmConstraint.enable();
    //leftLowArm.addConstraint(llArmConstraint);
    
    //Kusudama lrArmConstraint = new Kusudama(rightLowArm);
    //lrArmConstraint.addLimitConeAtIndex(0, new PVector(.5f, 1f, 0f), 1f);
    //lrArmConstraint.addLimitConeAtIndex(1, new PVector(-.5f, 1f, 0f), 1f);
    //lrArmConstraint.setAxialLimits(0.1f,0.3f);
    //lrArmConstraint.enable();
    //rightLowArm.addConstraint(lrArmConstraint);
    
    
    //enable pins
    top.enablePin();
    leftHand.enablePin();
    rightHand.enablePin();
    leftFoot.enablePin();
    rightFoot.enablePin();
}


PVector  mouse = new PVector(0,0,0);
public void drawBones() {
  simpleArmature.drawMe(this, 80, 50f);
}


public void setSceneAndCamera() {
  background(160, 100, 100);
  directionalLight(248, 248, 248, 0, 10, -10);
  mouse.x =  mouseX - (width/2); mouse.y = mouseY - (height/2)+300f;
  camera(cameraPosition, lookAt, up);
  //ortho(-width/2, width/2, -height/2, height/2, -10000, 10000);
  ortho(-width/2, width/2, (-height/2)-300f, (height/2)-300f, -10000, 10000);
}

public void drawInstructions() {
  fill(0);
  String instructionText =
      "-Click and drag to move the selected pin.\n"
       +"-To select a different pin, use the Up and Down arrows.\n"
      + "-Use the mouse wheel to rotate the pin about its (red) Y axis.\n" 
      + "-Hold shift while using the mouse wheel to rotate the pin about its (blue) Z axis. \n"
      + "-Hold ctrl while using the mouse wheel to rotate the pin about its (green) X axis. \n"
      + "-Current Order: Head, Left Leg, Right Leg, Left Arm, Right Arm,";
  
  text(instructionText, (-width/2f) + 20f, (-height/2f) + 320f); 
  textSize(20f);
  
}

public void drawBoneInfo() {
   ArrayList<?> BoneList = simpleArmature.getBoneList();
   for(Object ob : BoneList) {
     Bone b = (Bone)ob;
     String boneAngles = "";
     float[] angleArr = b.getXYZAngle();
     boneAngles += "  ( " + degrees(angleArr[0]) + ",   " + degrees(angleArr[1]) + ",   " + degrees(angleArr[2]) + "  )";
     fill(0);
     text(boneAngles,b.getBase().x, b.getBase().y); 
  }  
}


public void mouseWheel(MouseEvent event) {
        float e = event.getCount();
        if(event.isShiftDown()) {
            activeBone.getIKPin().getAxes().rotateAboutZ(e/TAU, true);
        } else {
            activeBone.getIKPin().getAxes().rotateAboutY(e/TAU, true);
        }
        activeBone.getIKPin().solveIKForThisAndChildren();
}

public void keyPressed() {
    if (key == CODED) {
        if (keyCode == DOWN) {            
            int currentPinIndex =(pinnedBones.indexOf(activePin) + 1) % pinnedBones.size();
            activePin  = pinnedBones.get(currentPinIndex);
            activeBone = (Bone)activePin.forBone();
        } else if (keyCode == UP) {
            int idx = pinnedBones.indexOf(activePin);
            int currentPinIndex =  (pinnedBones.size()-1) -(((pinnedBones.size()-1) - (idx - 1)) % pinnedBones.size());
            activePin  = pinnedBones.get(currentPinIndex);
            activeBone = (Bone)activePin.forBone();
        } 
    }
}

public void printXY(PVector p) {
    println(screenX(p.x, p.y, p.z)
            +", " + screenY(p.x, p.y, p.z));
}
public void line(PVector p1, PVector p2) {
    line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
}

public void point(PVector p) {
    point(p.x, p.y, p.z);
}
public void point(SGVec_3f p) {
    point(p.x, p.y, p.z);
}


PVector cameraPosition = new PVector(0, 0, 70); 
PVector lookAt = new PVector(0, 0, 0);
PVector up = new PVector(0, 1, 0);

public void camera(PVector cp, PVector so, PVector up) {
    camera(cp.x, cp.y, cp.z, so.x, so.y, so.z, up.x, up.y, up.z);
}

public void updatePinList() {
    pinnedBones.clear();
    recursivelyAddToPinnedList(pinnedBones, simpleArmature.getRootBone());
}

public void recursivelyAddToPinnedList(ArrayList<IKPin> pins, Bone descendedFrom) {
    ArrayList<Bone> pinnedChildren = (ArrayList<Bone>) descendedFrom.getMostImmediatelyPinnedDescendants(); 
    for(Bone b : pinnedChildren) {
        pins.add(b.getIKPin());
    }
    for(Bone b : pinnedChildren) {
        ArrayList<Bone> children = b.getChildren(); 
        for(Bone b2 : children) {
            recursivelyAddToPinnedList(pins, b2);
        }
    }
}
