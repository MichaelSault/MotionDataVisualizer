float[] x = new float[6];
float[] y = new float[6];
float[] z = new float[6];
float segLength = 50;
float xin = 0;
float yin = 0;
float zin = 0;
float movement = 0;

void setup() {
  size(640, 360, P3D);
  strokeWeight(20.0);
  stroke(255, 100);
}

void draw() {
  background(0);
  dragSegment(0, xin, yin, zin);
  dragSegment(1, x[0], y[0], z[0]);
  dragSegment(2, x[1], y[1], z[1]);
  dragSegment(3, x[2], y[2], z[2]);
  dragSegment(4, x[3], y[3], z[3]);
  dragSegment(5, x[4], y[4], z[4]);
}

void dragSegment(int i, float xin, float yin, float zin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float dz = zin - z[i];
  float angle = atan2(dy, dx);
  float angle2 = atan2(dx, dz);
  
  if (movement == 0){
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;
  } else if (movement == 1){
    y[i] = yin - sin(angle2) * segLength;
    z[i] = zin + cos(angle2) * segLength;
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


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP){
      xin = mouseX;
      yin = mouseY;
      movement = 0;
    }else if (keyCode == DOWN){
      yin = mouseX;
      zin = mouseY;
      movement = 0;
    }
  } 
}
