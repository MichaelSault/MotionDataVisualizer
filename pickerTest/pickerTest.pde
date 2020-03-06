//base example taken from https://forum.processing.org/two/discussion/5924/picking-3d-without-lib-but-peasycam-and-lights-wth
//example used for tests with picking and applying functions to objects

import shapes3d.utils.*;
import shapes3d.*;

import processing.opengl.*;

Box base;
Box second;
float a;
float left = 0;
float up = 0;
boolean mouseClicked = false;

void setup(){
  fullScreen(P3D);


  cursor(HAND);
  float size;
  
  size = 300;
  base = new Box(this,size,size+100,size);
  base.moveTo(width/2.0, height/2.0, random(-18,18));
  base.fill(randomColor());
  
  second = new Box(this, 200, 200, 200);
  second.moveTo(width/2.0, height/2.0-size, random(-18,18));
  second.fill(randomColor());
}

void draw(){
  background(0);
  keyPressedIsCheckedContinuusly();
  pushMatrix();
  ambientLight(200,200,200);
  directionalLight(128, 128, 128, -1, 0, -1);

    base.draw();
    second.draw();
    if(mouseClicked){
    Shape3D picked = Shape3D.pickShape(this,mouseX, mouseY);
    if(picked != null){
      //picked.moveBy(mouseX-1000, mouseY-500, random(-18,18));
      if (picked == base){
        picked.rotateBy((height/2.0-mouseY)/7500.0, (mouseX-width/2.0)/7500.0, 0);
        second.rotateBy((height/2.0-mouseY)/7500.0, (mouseX-width/2.0)/7500.0, 0);
      } else if (picked == second){
        picked.rotateBy((height/2.0-mouseY-300)/7500.0, (mouseX-width/2.0)/7500.0, 0);
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
