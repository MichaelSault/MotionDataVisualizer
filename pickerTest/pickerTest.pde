import shapes3d.utils.*;
import shapes3d.*;
import shapes3d.ShapeGroup;

import processing.opengl.*;

Box base;
Box second;
ShapeGroup group1;

float a;
float left = 0;
float up = 0;
boolean mouseClicked = false;

void setup(){
  fullScreen(P3D);

  cursor(HAND);
  float size;
  
  group1 = new ShapeGroup();
  
  size = 300;
  base = new Box(size,size+100,size);
  //base.moveTo(width/2.0, height/2.0, random(-18,18));
  base.fill(randomColor());
  
  group1.addChild(base);
  
  second = new Box(200, 200, 200);
  
  second.fill(randomColor());
  group1.addChild(second);
  group1.moveTo(width/2.0, height/2.0, random(-18,18));
  second.moveTo(0, -size, 0);
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
    if(mouseClicked){
      Picked picked = Shape3D.pick(this, getGraphics(), mouseX, mouseY);
    if(picked != null){
      //picked.moveBy(mouseX-1000, mouseY-500, random(-18,18));
      if (picked.shape == base){
        group1.rotateBy((height/2.0-mouseY)/7500.0, (mouseX-width/2.0)/7500.0, 0);
      } else if (picked.shape == second){
        picked.shape.rotateBy((height/2.0-mouseY-300)/7500.0, (mouseX-width/2.0)/7500.0, 0);
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
