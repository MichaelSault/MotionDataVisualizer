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
  //keyPressedIsCheckedContinuusly();
 
  // HUD https : // en.wikipedia.org/wiki/Head-up_display ------------- 
  camera();
  noLights();
  hint(DISABLE_DEPTH_TEST);  
  fill(255);
  textSize(26);
  text("Use Mouse To Move XY, Use Scroll Wheel for Z", 30, 30);
    
  //text("\nPress 2 to move in XY Only", 30, 30);
    
  //text("\n\nPress 4 to move in XZ Only", 30, 30);
  xin = mouseX;
  yin = mouseY;
    
  strokeWeight(0.5);
  stroke(255, 0, 0);
  noFill();
  dragSegment(0, xin, yin, zin);
  stroke(255);
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
 
//void keyPressedIsCheckedContinuusly() {
 
//  float Radius = 13;
 
//  if (keyPressed) {
//    if (key == '1'){
//      xin = mouseX;
//      yin = mouseY;
//      movement = 0;
    //}else if (key == '2'){
    //  xin = mouseX;
    //  yin = mouseY;
    //  movement = 1;
    //}else if (key == '3'){
    //  zin = mouseY;
    //  xin = mouseX;
    //  movement = 2;
    //}
//    }// if(keyPressed)
//}
 
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
  
  //if (movement == 0){
      float angle1 = atan2(dy, dx);
      float angle2 = atan2(dz, dy);
      x[i] = xin - cos(angle1) * segLength;
      y[i] = yin - (sin(angle1) * segLength);
      z[i] = zin - sin(angle2) * segLength;
  //} else if (movement == 1){
  //   float angle1 = atan2(dy, dx);
  //   float angle2 = atan2(dz, dy);
  //    x[i] = xin - cos(angle1) * segLength;
  //    y[i] = yin - sin(angle2) * segLength;
  //    z[i] = zin - sin(angle2) * segLength;
  //}
  //} else if (movement == 2){
  //    float angle2 = atan2(dz, dx);
  //    x[i] = xin - cos(angle2) * segLength;
  //    //y[i] = yin - sin(angle2) * segLength;
  //    z[i] = zin - sin(angle2) * segLength;
  //}
 
  segment(x[i], y[i], z[i], angle);
  
}

void segment(float x, float y, float z, float a) {
  pushMatrix();
  translate(x, y, z);
  rotate(a);
  sphere(20);
  popMatrix();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zin += e*5;
  println(mouseY);
}
