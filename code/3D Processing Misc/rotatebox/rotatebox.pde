float inc = 0;

void setup(){
  size(600, 600, P3D);
}

void draw(){
  background(0);
  lights();
  inc+=0.05;
  pushMatrix();
  translate(mouseX, mouseY);
  //rotateX(mouseX*0.01);
  //rotateY(mouseY*0.01);
  rotateZ(inc);
  box(150);
  popMatrix();
}
