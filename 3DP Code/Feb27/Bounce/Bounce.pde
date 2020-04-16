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

// ball location
float x=0, y=0, z=0;
// ball speeds
float xs=int(random(3,10)); 
float ys=int(random(3,10)); 
float zs=int(random(3,10));

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(0);

  // Make 0,0,0 center of scene, rotate all axises
  translate(width/2, height/2, 0);
  lights();

  // Wire frame box in which the ball bounces
  pushMatrix();
  stroke(255);
  strokeWeight(5);
  noFill();
  translate(0, 0, 0);
  box(800);
  popMatrix();
  
  strokeWeight(2);
  for (int i = -400; i < 400; i = i+50) {
    line(i, -400, -400, i, 400, -400);
  }
  
  for (int i = -400; i < 400; i = i+50) {
    line(-400, i, -400, 400, i, -400);
  }


  // Bouncing ball
  pushMatrix();
  translate(x, y, z);
  rectMode(CENTER);
  strokeWeight(1);
  stroke(255,0,0);
  //fill(255);
  noFill();
  sphere(50);
  popMatrix();

  // Update ball position, bounce if reach box edge (box is -350 to 350, ball is 50)
  x=x+xs;
  if (x > 350 || x < -350) {
    x=x-xs;
    xs=-xs;
  }

  y=y+ys;
  if (y > 350 || y < -350) {
    y=y-ys;
    ys=-ys;
  }

  z=z+zs;
  println(z);
  if (z > 350 || z < -350) {
    z=z-zs;
    zs=-zs;
  }
}
