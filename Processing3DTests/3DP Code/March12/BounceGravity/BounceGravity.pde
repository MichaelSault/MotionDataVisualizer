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

float upgrav = 0.0;
float leftgrav = 0.0;
float ingrav = 0.0;

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
  //rotateX(-PI/8);
  translate(x, y, z);
  rectMode(CENTER);
  strokeWeight(1);
  stroke(255,0,0);
  //fill(255);
  noFill();
  sphere(50);
  popMatrix();

  // Update ball position, bounce if reach box edge (box is -350 to 350, ball is 50)
  xs = xs + leftgrav;
  x=x+xs;
  if (x > 350 || x < -350) {
    x=x-xs;
    if (leftgrav != 0){
      xs=-xs * (.9);
      
    } else xs = -xs;
  }

  ys = ys + upgrav;
  y=y+ys;
  if (y > 300 || y < -300) {
    y=y-ys;
    if (upgrav != 0){
      ys=-ys * (.9);
    } else ys = -ys;
  }
  
  zs = zs + ingrav;
  z=z+zs;
  if (z > 300 || z < -300) {
    z=z-zs;
    if (ingrav != 0){
      zs=-zs * (.9);
    } else zs = -zs;
  }



textSize(30);
fill(204, 0 , 0);

if (leftgrav == 1){
  text("X-Axis: Right", -350, -350); 
} else if (leftgrav == -1) {
  text("X-Axis: Left", -350, -350); 
} else if (leftgrav == 0) {
  text("X-Axis: None", -350, -350); 
}

fill(0, 128 , 255);
if (upgrav == 1){
  text("Y-Axis: Down", -350, -325); 
} else if (upgrav == -1) {
  text("Y-Axis: Up", -350, -325); 
} else if (upgrav == 0) {
  text("Y-Axis: None", -350, -325); 
}

fill(0, 153 , 0);
if (ingrav == 1){
  text("Z-Axis: Out", -350, -300); 
} else if (ingrav == -1) {
  text("Z-Axis: In", -350, -300); 
} else if (ingrav == 0) {
  text("Z-Axis: None", -350, -300); 
}

}

//=========================================================================================
//Press Button To Apply Gravity
//=========================================================================================

 
  void keyPressed() {
    if ((key == 'w')||(key == 'W')){
      if (upgrav == -1){
        upgrav = 0;
      } else {
        upgrav = -1;
      }
    } else if ((key == 's')||(key == 'S')){
      if (upgrav == 1){
        upgrav = 0;
      } else upgrav = 1;
    } else if ((key == 'a')||(key == 'A')) {
      if (leftgrav == -1){
        leftgrav = 0;
      } else leftgrav = -1;
    } else if ((key == 'd')||(key == 'D')) {
      if (leftgrav == 1){
        leftgrav = 0;
      } else leftgrav = 1;
    } else if ((key == 'q')||(key == 'Q')) {
      if (ingrav == -1){
        ingrav = 0;
      } else ingrav = -1;
    } else if ((key == 'e')||(key == 'E')) {
      if (ingrav == 1){
        ingrav = 0;
      } else ingrav = 1;
    }
}
