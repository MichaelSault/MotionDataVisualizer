import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

Box base;
Box second;
Box parent;

ShapeGroup group1;

float a;
float left = 0;
float up = 0;
boolean mouseClicked = false;

void setup(){
  size(1280, 720, P3D);

  cursor(HAND);
  
  //declare shapeGroups
  group1 = new ShapeGroup();
  
  //define body
  base = new Box(100,100,100);
  base.moveTo(-150, 0, 0);
  base.fill(randomColor());
  
  second = new Box (100, 100, 100);
  second.moveTo(150, 0, 0);
  second.fill(randomColor());
  
  parent = new Box (75, 75, 75);
  parent.moveTo(0, 0, 0);
  parent.fill(randomColor());
  
  group1.addChild(base);
  group1.addChild(second);
  group1.addChild(parent);
  group1.moveTo(width/2.0, height/2.0, 0);
  
}


void draw(){
  background(0);
  keyPressedIsCheckedContinuusly();
  pushMatrix();
  ambientLight(200,200,200);
  directionalLight(128, 128, 128, -1, 0, -1);

    group1.draw(getGraphics());
    if(mouseClicked){
      Picked picked = Shape3D.pick(this, getGraphics(), mouseX, mouseY);
    if(picked != null){
      if (picked.shape == base){
        if (left == 1){
           base.rotateBy(0, -0.01, 0);
        } else if (left == -1){
           base.rotateBy(0, 0.01, 0);
        }
        if (up == 1){
           base.rotateBy(0.01, 0, 0);
        } else if (up == -1){
           base.rotateBy(-0.01, 0, 0);
        }
      }  else if (picked.shape == second){
        if (left == 1){
           second.rotateBy(0, -0.01, 0);
        } else if (left == -1){
           second.rotateBy(0, 0.01, 0);
        }
        if (up == 1){
           second.rotateBy(0.01, 0, 0);
        } else if (up == -1){
           second.rotateBy(-0.01, 0, 0);
        }
      }  else if (picked.shape == parent){
        if (left == 1){
           group1.rotateBy(0, -0.01, 0);
        } else if (left == -1){
           group1.rotateBy(0, 0.01, 0);
        }
        if (up == 1){
           group1.rotateBy(0.01, 0, 0);
        } else if (up == -1){
           group1.rotateBy(-0.01, 0, 0);
        }
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
      left = 1;
    } else if (key == 'd' || key == 'D'){
      left = -1;
    } else if (key == 'w' || key == 'W'){
      up = 1;
    } else if (key == 's' || key == 'S'){
      up = -1;
    }
  }else{
    left = 0;
    up = 0;
    //textSize(26);
    //text("Button Pressed: NONE", 30, 30);
    //text("\nMouse Dependent Rotation", 30, 30);// if(keyPressed)
  }
}
