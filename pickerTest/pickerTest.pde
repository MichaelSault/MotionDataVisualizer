import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

Box body;
Box head;
Box leftUpArm;
Box rightUpArm;
Box leftLowArm;
Box rightLowArm;
ShapeGroup group1;
ShapeGroup group2;
ShapeGroup group3;
ShapeGroup group4;
ShapeGroup group5;

float a;
float left = 0;
float up = 0;
boolean mouseClicked = false;

void setup(){
  fullScreen(P3D);

  cursor(HAND);
  float size;
  
  //declare shapeGroups
  group1 = new ShapeGroup();
  group2 = new ShapeGroup();
  group3 = new ShapeGroup();
  group4 = new ShapeGroup();
  group5 = new ShapeGroup();
  
  size = 300;
  
  //define body
  body = new Box(size,size+100,size/2.0);
  body.fill(randomColor());
    
  //define head
  head = new Box(200, 200, 200);
  head.fill(randomColor());
  
  //create Shape Group 1
  group1.addChild(body);
  group1.addChild(head);
  
  group1.moveTo(width/2.0, height/2.0, 0);
  head.moveTo(0, -size, 0);
  
  //define arms
  leftUpArm = new Box(70, 200, size/2.0);
  leftUpArm.fill(randomColor());
  leftLowArm = new Box(70, 200, size/2.0);
  leftLowArm.fill(randomColor());
  
  //create Shape Group 2
  group2.addChild(leftUpArm);
  //group2.addChild(leftLowArm);
  group2.moveTo(width/2.0-187, height/2.0-100, 0);
  //leftUpArm.moveTo(-187, -100, 0);
  //leftLowArm.moveTo(-187, 100, 0);
  
  //group1.addChild(leftUpArm);
  //group1.addChild(leftLowArm);
}


void draw(){
  background(0);
  keyPressedIsCheckedContinuusly();
  pushMatrix();
  ambientLight(200,200,200);
  directionalLight(128, 128, 128, -1, 0, -1);

    //base.draw(getGraphics());
    //second.draw(getGraphics());
    group1.draw(getGraphics());
    group2.draw(getGraphics());
    if(mouseClicked){
      Picked picked = Shape3D.pick(this, getGraphics(), mouseX, mouseY);
    if(picked != null){
      if (picked.shape == body){
        //group2.moveTo(width/2.0, height/2.0, 0);
        //leftUpArm.moveTo(-187, -100, 0);
        //leftLowArm.moveTo(-187, 100, 0);
        group1.rotateBy((height/2.0-mouseY)/7500.0, (mouseX-width/2.0)/7500.0, 0);
        group2.rotateBy((height/2.0-mouseY)/7500.0, (mouseX-width/2.0)/7500.0, 0);
      } else if (picked.shape == head){
        picked.shape.rotateBy((height/2.0-mouseY-300)/7500.0, (mouseX-width/2.0)/7500.0, 0);
      } else if ((picked.shape == leftUpArm) || (picked.shape ==leftLowArm)){
        //group2.moveTo(width/2.0-187, height/2.0-100, 0);
        //leftUpArm.moveTo(0, 0, 0);
        //leftLowArm.moveTo(0, 0, 0);
        group2.rotateByY(-(width/2.0-mouseX-150)/7500.0);
        group2.rotateByZ(-(height/2.0-mouseY-187)/7500.0);
      }
    } else if(picked == null){
      mouseClicked = false;
    }
  }

  popMatrix();
  a += 0.002;
}

void mouseClicked(){
  mouseClicked = true;
}

int randomColor(){
  return color(random(0,255), random(0,255), random(0,255));
}

//----------------------------------------------------------------------------------------------------------------------
void keyPressedIsCheckedContinuusly() {
 
  float Radius = 13;
 
  if (keyPressed) {
    if (key == 'a' || key == 'A'){
      left += 1;
    } else if (key == 'd' || key == 'D'){
      left -= 1;
    }
  }else{
    //textSize(26);
    //text("Button Pressed: NONE", 30, 30);
    //text("\nMouse Dependent Rotation", 30, 30);// if(keyPressed)
  }
}
