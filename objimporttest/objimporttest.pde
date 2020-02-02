import processing.opengl.PShapeOpenGL;

PGraphics3D renderer;

final PVector eye = new PVector();
final PVector lookAt = new PVector();
final PVector up = new PVector();

float depth;
float fov = THIRD_PI;
float aspect;
float near;
float far;
float whalf;
float hhalf;

PShapeOpenGL skeleton;

void setup() {
  fullScreen(P3D);
  renderer = (PGraphics3D)getGraphics();
  
  whalf = width * 0.5;
  hhalf = height * 0.5;
  depth = height * sqrt(3.0) * 0.5;
  aspect = width / (float)height;
  near = depth * 0.0001;
  far = depth * 1000.0;
  eye.set(depth, -depth, depth);
  lookAt.set(0.0, 0.0, 0.0);
  up.set(0.0, 0.0, -1.0);
  
  skeleton = (PShapeOpenGL)renderer.loadShape("skeleton.obj");
  skeleton = (PShapeOpenGL)skeleton.getTessellation();

  PImage texture = loadImage("skeletondiffuse.png");
  skeleton.setTextureMode(NORMAL);
  skeleton.setTexture(texture);
}

void draw() {
  surface.setTitle(String.format("%.2f", frameRate)); //monitors the framerate
  background(0xff101010);
  perspective(fov, -aspect, near, far);
  camera(eye.x, eye.y, eye.z, lookAt.x, lookAt.y, lookAt.x, up.x, up.y, up.z);
  drawOrigin(renderer, 100.0, 1.25);
  noStroke();
  lights();
  
  scale(50);
  shape(skeleton, 0, 0);
}

void lights(){
  ambientLight(20.0, 20.0, 20.0);
  //0xfffff7d5
  directionalLight(255, 245, 215, 0, -0.6, 0.8);
}

static void drawOrigin(PGraphics3D renderer, float len, float sw) {
  renderer.pushStyle();
  renderer.strokeWeight(sw);
  renderer.stroke(0xffff0000); //red
  renderer.line(0.0, 0.0, 0.0, len, 0.0, 0.0); //right
  renderer.stroke(0xff00ff00); //green
  renderer.line(0.0, 0.0, 0.0, 0.0, len, 0.0); //forward
  renderer.stroke(0xff0000ff); //blue
  renderer.line(0.0, 0.0, 0.0, 0.0, 0.0, len); //up
  
  renderer.popStyle();
  
  
  
}
