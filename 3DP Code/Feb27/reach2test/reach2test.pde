//===============================================================================
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
// School: University of Ottawa
//===============================================================================


int numSegments = 20;
float[] x = new float[numSegments];
float[] y = new float[numSegments];
float[] z = new float[numSegments];
float[] angle = new float[numSegments];
float[] angle2 = new float[numSegments];
float segLength = 35;
float targetX, targetY, targetZ;
float zin;

// camera / where you are 
float xpos, ypos, zpos, 
  xlookat, ylookat, zlookat, 
  xCamOwnAngle=0, yCamOwnAngle=1.0, zCamOwnAngle=0;
  
// "Floor" has y-value (the plane you fly in (y-direction)) 
final float floorLevel = 500.0;


//--------------------------------------------------------------
void setup() {
  size(1900, 990, P3D);
  strokeWeight(10.0);
  stroke(255, 0, 0);
  x[x.length-1] = width/2;  // Set base x-coordinate
  y[x.length-1] = height/2;   // Set base y-coordinate
  z[x.length-1] = 0;  //set base z-coordinate
}

void draw() {
  background(0);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0) + 200, width/2.0, height/2.0, 0, 0, 1, 0);
  drawMainSceneIn3D();
  
  reachSegment(0, mouseX, mouseY, zin);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY, targetZ);
  }
  for(int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<x.length; i++) {
    if (i == 0) {
      strokeWeight(0.2);
      stroke(255, 0, 0);
      noFill();
    } else {
      stroke(255);
    }
    segment(x[i], y[i], z[i], angle[i], angle2[i], (i+1)*2); 
  }
}

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

//---------------------------------------------------------------------------


void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength;
  z[b] = z[a] + sin(angle2[a]) * segLength;
}

void reachSegment(int i, float xin, float yin, float zin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float dz = zin - z[i];
  angle[i] = atan2(dy, dx);
  angle2[i] = atan2(dz, dy);
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
  targetZ = zin - sin(angle2[i]) * segLength;
}

void segment(float x, float y, float z, float a, float a2, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y, z);
  rotate(a);
  rotateZ(a2);
  sphere(20);
  popMatrix();
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zin += e*5;
}
