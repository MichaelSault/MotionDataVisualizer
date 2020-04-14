import peasy.*;

PeasyCam cam;

int num = 2000;
int range = 6;

float[] ax = new float[num];
float[] ay = new float[num]; 
float[] az = new float[num]; 


void setup() 
{
  fullScreen(P3D);
  
  cam = new PeasyCam(this, 0, 0, 0, 50);
  cam.setMinimumDistance(-1000);
  cam.setMaximumDistance(1000);
  
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
    az[i] = 0;
  }
  frameRate(30);
  
  // Make 0,0,0 center of scene, rotate all axises
  translate(width/2, height/2, 0);
  lights();

  // Wire frame box in which the ball bounces
  pushMatrix();
  stroke(255);
  noFill();
  translate(0, 0, 0);
  strokeWeight(5);
  box(800);
  popMatrix();
}

void draw() 
{
  background(0);
  
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
    az[i-1] = az[i];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);
  az[num-1] += random(-range, range);

  //// Constrain all points to the screen
  //ax[num-1] = constrain(ax[num-1], 0, width);
  //ay[num-1] = constrain(ay[num-1], 0, height);
  //az[num-1] = constrain(az[num-1], 0, width);
  
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
    stroke(val);
    line(ax[i-1], ay[i-1], az[i-1], ax[i], ay[i], az[i]);
  }
}
