float x = 100;
float y = 100;
float z = 0;
float zin = 0;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 100;
float ax = 0.0;
float ay = 0.0;
float az = 0.0;
int value = 0;

// "Floor" has y-value (the plane you fly in (y-direction)) 
final float floorLevel = 500.0;

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
  float dz = zin - z;
  angle1 = atan2(dy, dx);
  angle2 = atan2(dz, 0);
  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
  z = zin - (sin(angle2) * segLength);
 
  segment(x, y, z, angle1); 
  knob(x, y, z, angle1);
}

void segment(float x, float y, float z, float a) {
  pushMatrix();
  translate(x, y, z);
  rotateY(ay);
  rotateZ(az);
  rotateX(ax);
  rotate(a);
  strokeWeight(10);
  stroke(255);
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
  gridOnFloor();
  
  popMatrix();
}//func


void gridOnFloor() {
 
  // pushMatrix();
 
  noFill();
 
  // add
  int d = int ( 24000 / 200);
 
  // diameter
  int d1 = d;
 
  float floorLevel1 = 2* floorLevel; 
 
  // color
  stroke(111);  // gridColor);
  // rectMode(CENTER);
  strokeWeight(1);
 
  for (int x = -12000; x <= 12000; x += d) {
    for (int y = -12000; y <= 12000; y += d) {
      //rect(x, y, d1, d1);
      line(x, floorLevel1, y, 
        x+d1, floorLevel1, y); 
      line(x, floorLevel1, y, 
        x, floorLevel1, y+d1); 
      line(x, floorLevel1, y+d1, 
        x+d1, floorLevel1, y+d1);
    }
  }
 

}

//----------------------------------------------------------------

void knob(float x, float y, float z, float a) {
  pushMatrix();
  translate(x, y, z);
  rotate(a);
  noFill();
  stroke(255, 0, 0);
  strokeWeight(.1);
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
      zin += 2;
      text("Button Pressed: Z", 30, 30);
      text("\nMoving On: Z-Axis", 30, 30);
    }else if (key == 'x' || key == 'X'){
      zin -= 2;
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
