// https : // forum.processing.org/two/discussion/24912/radar-view-of-infinite-3d-space#latest
// https : // www.openprocessing.org/sketch/25255
 
// all vars 
float[] x = new float[6];
float[] y = new float[6];
float[] z = new float[6];
float segLength = 50;
float xin = 0;
float yin = 0;
float zin = 0;
float movement = 0;

// camera / where you are 
float xpos, ypos, zpos, 
  xlookat, ylookat, zlookat, 
  xCamOwnAngle=0, yCamOwnAngle=1.0, zCamOwnAngle=0;
 
float angle=0.0; // (angle left / right; 0..359)
 
// "Floor" has y-value (the plane you fly in (y-direction)) 
final float floorLevel = 500.0;
 
// ---------------------------------------------------------------
 
void setup() {
  size(1900, 990, P3D);
  strokeWeight(10.0);
  stroke(255, 0, 0);
 
}//func 
 
void draw() {
 
  background(0);
 
  // draw Main Scene in 3D
  drawMainSceneIn3D(); 
 
  // read key throughout 
  keyPressedIsCheckedContinuusly();
 
  // HUD https : // en.wikipedia.org/wiki/Head-up_display ------------- 
  camera();
  noLights();
  hint(DISABLE_DEPTH_TEST);  
  fill(255);
  text("press up to move in X and Y)",
    18, 18);
    
  text("\npress down to move in X and Z)",
    18, 18);
    
    
    
  dragSegment(0, xin, yin, zin);
  dragSegment(1, x[0], y[0], z[0]);
  dragSegment(2, x[1], y[1], z[1]);
  dragSegment(3, x[2], y[2], z[2]);
  dragSegment(4, x[3], y[3], z[3]);
  dragSegment(5, x[4], y[4], z[4]);
}//func 
 
//---------------------------------------------------------------
 
void drawMainSceneIn3D() {
  // draw Main Scene in 3D (main screen)
 
  hint(ENABLE_DEPTH_TEST);
 
 
  pushMatrix();
  lights();
  noFill();
  stroke(255);
  gridOnFloor();
  
  popMatrix();
}//func
 
// --------------------------------------------------------------------------
// Inputs 
 
void keyPressedIsCheckedContinuusly() {
 
  float Radius = 13;
 
  if (key == CODED) {
    if (keyCode == UP){
      xin = mouseX;
      yin = mouseY;
      movement = 0;
    }else if (keyCode == DOWN){
      zin = mouseY;
      xin = mouseX;
      movement = 1;
    }
  }// if(keyPressed)
}
 
// --------------------------------------------------------------------------------
 
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
 
  // rectMode(CORNER);
  //popMatrix();
}

void dragSegment(int i, float xin, float yin, float zin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float dz = zin - z[i];
  
  if (movement == 0){
    float angle = atan2(dy, dx);
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;
    z[i] = zin - sin(angle) * segLength;
  } else if (movement == 1){
    float angle = atan2(dz, dx);
    x[i] = xin - sin(angle) * segLength;
    y[i] = yin - cos(angle) * segLength;
    z[i] = zin - sin(angle) * segLength;
  }
 
  segment(x[i], y[i], z[i], angle);
  
}

void segment(float x, float y, float z, float a) {
  pushMatrix();
  translate(x, y, z);
  rotate(a);
  sphere(20);
  popMatrix();
}
