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
  
  strokeWeight(20.0);
  stroke(255, 100);
}

void draw() {
  background(0);
  
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 
  segment(x, y, z, angle1); 
  knob(x, y, z, angle1);
}

void segment(float x, float y, float z, float a) {
  pushMatrix();
  translate(x, y, z);
  rotateY(ay);
  rotateZ(a);
  rotateX(az);
  line(0, 0, 0, segLength, 0, 0);
  popMatrix();
}

void knob(float x, float y, float z, float a) {
  pushMatrix();
  translate(x, y, z);
  rotate(a);
  sphere(20);
  popMatrix();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP){
      z += 10;
    } else if (keyCode == DOWN) {
      z -= 10;
    } else if (keyCode == RIGHT) {
      ay += .2;
    } else if (keyCode == LEFT) {
      ay -= .2;
    } else if (keyCode == ALT) {
      az += .2;
    } else if (keyCode == CONTROL) {
      az -= .2;
    } else if (keyCode == SHIFT) {
      z += 10;
    } else if (keyCode == TAB) {
      z += 10;
    }
  } 
}
