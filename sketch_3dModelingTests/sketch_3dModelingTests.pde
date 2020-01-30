import damkjer.ocd.*;


float x0 = 0;
float y0 = 0;
float phi0 = 0.5;
float theta0 = 2;

float phi = phi0;
float theta = theta0;
final float bottomAngleLimit = PI/6;
final float topAngleLimit = 5*PI/6;

Camera camera;
float cameraDistance = 100;
final float cameraDistanceMin = 50;
final float cameraDistanceMax = 500;

PImage imgTemp; //defines imported image

void setup()
{
  fullScreen(P3D);
  camera = new Camera(this, 50, 50, 50);
  updateView();
  
  imgTemp = loadImage("person.png"); //imports image from 
}

void draw()
{
  camera.feed();
  background(204);
  lights();

  
  rotatedImage(imgTemp, 0, 0, 100, 150, 20, 0, 0, PI/12); 
  rotatedImage(imgTemp, 0, -50, 0, 50, 150, 0, PI, 0); 
  rotatedImage(imgTemp, 0, 50, 0, 50, 50, PI/2, 0, 0); 


  translatedBox(0, 0, 0, 50, 30, 5, 0, 0, PI/3);
  translatedBox(50, 0, 0, 10, 10, 10, PI, PI/2, 0);
  
  translatedSphere(100, 0, 0, 40, 0, 0, PI/5);
  translatedSphere(120, -40, -10, 10, 0, PI/5, 0);
  translatedSphere(90, 0, 30, 25, PI, 0, 0);
  
}

//function to 
void rotatedImage(PImage img, float x, float y, float z, float xSize, float ySize, float xRotate, float yRotate, float zRotate)
{
  pushMatrix();
  translate(x, y, z);
  rotateX(xRotate);
  rotateY(yRotate);
  rotateZ(zRotate);
  image(img, 0, 0, xSize, ySize);
  popMatrix();
}  

//function called from draw to create a box
void translatedBox(float x, float y, float z, float xSize, float ySize, float zSize, float xRotate, float yRotate, float zRotate)
{
  pushMatrix();
  translate(x, y, z);
  rotateX(xRotate);
  rotateY(yRotate);
  rotateZ(zRotate);
  fill(#ff8800);
  box(xSize, ySize, zSize);
  popMatrix();
}  


//function called from draw to create a box
void translatedSphere(float x, float y, float z, float radius, float xRotate, float yRotate, float zRotate)
{
  pushMatrix();
  translate(x, y, z);
  rotateX(xRotate);
  rotateY(yRotate);
  rotateZ(zRotate);
  fill(#eeee00);
  sphere(radius);
  popMatrix();
}  

//allows the camera to me moved with the mouse
void mousePressed()
{
  x0 = mouseX;
  y0 = mouseY;
  phi0 = phi;
  theta0 = theta;
  updateView();
}

void mouseDragged()
{
  phi = phi0 + map(mouseX - x0, 0, width, 0, PI);
  theta = theta0 + map(mouseY - y0, 0, height, 0, PI);
  theta = constrain(theta, bottomAngleLimit, topAngleLimit);

  updateView();
}

void mouseWheel(MouseEvent event)
{
  cameraDistance += event.getCount();
  cameraDistance = constrain(cameraDistance, cameraDistanceMin, cameraDistanceMax);

  updateView();
}

void updateView()
{
  float x = cameraDistance * sin(theta) * cos(phi);
  float y = cameraDistance * cos(theta);
  float z = cameraDistance * sin(theta) * sin(phi);
  camera.jump(x, y, z);
}
