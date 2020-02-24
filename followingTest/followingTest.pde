float x = 100;
float y = 100;
float z = 0;
float angle1 = 0.0;
float segLength = 100;
float ax = 0.0;
float ay = 0.0;
float az = 0.0;
int value = 0;


void setup() {
  size(800, 500, P3D);
  
  strokeWeight(10.0);
  stroke(255, 0, 0);
}

void draw() {
  background(0);
  drawMainSceneIn3D();
  keyPressedIsCheckedContinuusly();
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
  //z = mouseX - (sin(angle1) * segLength);
 
  segment(x, y, z, angle1); 
  knob(x, y, z, angle1);
}

void segment(float x, float y, float z, float a) {
  pushMatrix();
  translate(x, y, z);
  rotateY(ay);
  rotateX(ax);
  rotateZ(a + az);
  line(0, 0, 0, segLength, 0, 0);
  popMatrix();
}

//---------------------------------------------------------------
 
void drawMainSceneIn3D() {
  // draw Main Scene in 3D (main screen)
 
  hint(ENABLE_DEPTH_TEST);
 
 
  pushMatrix();
  lights();
  //noFill();
  stroke(255);
  //gridOnFloor();
  
  popMatrix();
}//func

//----------------------------------------------------------------

void knob(float x, float y, float z, float a) {
  pushMatrix();
  translate(x, y, z);
  rotate(a);
  sphere(20);
  popMatrix();
}

//----------------------------------------------------------------

void keyPressedIsCheckedContinuusly() {
 
  float Radius = 13;
 
  if (keyPressed) {
    if (key == 'q' || key == 'Q'){
      az += 0.2;
      text("Button Pressed: Q", 30, 30);
      text("\nRotating On: Z-Axis", 30, 30);
    }else if (key == 'e' || key == 'E'){
      az -= 0.2;
      text("Button Pressed: E", 30, 30);
      text("\nRotating On: Z-Axis", 30, 30);
    }else if (key == 'a' || key == 'A'){
      ay += 0.2;
      text("Button Pressed: A", 30, 30);
      text("\nRotating On: Y-Axis", 30, 30);
    }else if (key == 'd' || key == 'D'){
      ay -= 0.2;
      text("Button Pressed: D", 30, 30);
      text("\nRotating On: Y-Axis", 30, 30);
    }else if (key == 'w' || key == 'W'){
      ax += 0.2;
      text("Button Pressed: W", 30, 30);
      text("\nRotating On: X-Axis", 30, 30);
    }else if (key == 's' || key == 'S'){
      ax -= 0.2;
      text("Button Pressed: S", 30, 30);
      text("\nRotating On: X-Axis", 30, 30);
    }else if (key == 'z' || key == 'Z'){
      z += 1;
      text("Button Pressed: Z", 30, 30);
      text("\nMoving On: Z-Axis", 30, 30);
    }else if (key == 'x' || key == 'X'){
      z -= 1;
      text("Button Pressed: X", 30, 30);
      text("\nMoving On: Z-Axis", 30, 30);
    } else {
      text("Button Pressed: NONE", 30, 30);
      text("\nMouse Dependent Rotation", 30, 30);// if(keyPressed)
    }
  }else{
    textSize(26);
    text("Button Pressed: NONE", 30, 30);
    text("\nMouse Dependent Rotation", 30, 30);// if(keyPressed)
  }
}
