import picking.*;

Picker picker;
float a = 0.0;

void setup() {
  fullScreen (P3D);
  picker = new Picker(this);
}

void draw() {

  background(255);

  picker.start(0);
  translatedBox(500, 750, 30, 500, 300, 50, 0, 0, PI/3, #ff8800);

  picker.start(1);
  translatedSphere(1200, 800, 0, 150, PI, PI/2, 0, #800080);
  
  picker.start(2);
  translatedBox(750, 200, 30, 200, 200, 200, 0, 0, PI/3, #0000A0);

  picker.stop();

  color c = 0;
  int id = picker.get(mouseX, mouseY);
  switch (id) {
    case 0:
      c = #ff8800;
      break;
    case 1:
      c = #800080;
      break;
    case 2:
      c = #0000A0;
      break;
  }
  drawBorder(10, c);
}


void drawBorder(int w, color c) {
  noStroke();
  fill(c);
  rect(0,   0, width, w);
  rect(0, height - w, width, w);
  rect(0,   0, w, height);
  rect(width - w, 0, w, height);
}

//function called from draw to create a box
void translatedBox(float x, float y, float z, float xSize, float ySize, float zSize, float xRotate, float yRotate, float zRotate, color c)
{
  pushMatrix();
  translate(x, y, z);
  rotateX(xRotate);
  rotateY(yRotate);
  rotateZ(zRotate);
  fill(c);
  box(xSize, ySize, zSize);
  popMatrix();
}  

//function called from draw to create a box
void translatedSphere(float x, float y, float z, float radius, float xRotate, float yRotate, float zRotate, color c)
{
  pushMatrix();
  translate(x, y, z);
  rotateX(xRotate);
  rotateY(yRotate);
  rotateZ(zRotate);
  fill(c);
  sphere(radius);
  popMatrix();
}  
