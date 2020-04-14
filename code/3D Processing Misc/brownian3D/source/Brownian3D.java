import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Brownian3D extends PApplet {



PeasyCam cam;

int num = 2000;
int range = 6;

float[] ax = new float[num];
float[] ay = new float[num]; 
float[] az = new float[num]; 


public void setup() 
{
  
  
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

public void draw() 
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
    float val = PApplet.parseFloat(i)/num * 204.0f + 51;
    stroke(val);
    line(ax[i-1], ay[i-1], az[i-1], ax[i], ay[i], az[i]);
  }
}
  public void settings() {  size(640, 360, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Brownian3D" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
