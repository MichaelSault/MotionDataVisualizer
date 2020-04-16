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
float rx = int(random(-350,350)), ry = int(random(-350,350)), rz = int(random(-50,-750));;
float bx = int(random(-350,350)), by = int(random(-350,350)), bz = int(random(-50,-750));
float gx = int(random(-350,350)), gy = int(random(-350,350)), gz = int(random(-50,-750));;

float tx = 0, ty = 0, tz = 0;

// ball speeds
float rxs=int(random(3,10)); 
float rys=int(random(3,10)); 
float rzs=int(random(3,10));

float bxs=int(random(3,10)); 
float bys=int(random(3,10)); 
float bzs=int(random(3,10));

float gxs=int(random(3,10)); 
float gys=int(random(3,10)); 
float gzs=int(random(3,10));

float txs=0; 
float tys=0;
float tzs=0;

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
  noFill();
  translate(0, 0, 0);
  strokeWeight(10);
  box(800);
  popMatrix();
  
  strokeWeight(2);
  for (int i = -400; i < 400; i = i+50) {
    line(i, -400, -400, i, 400, -400);
  }
  
  for (int i = -400; i < 400; i = i+50) {
    line(-400, i, -400, 400, i, -400);
  }


  // RED Bouncing ball
  pushMatrix();
  rotateX(-PI/8);
  translate(rx, ry, rz);
  rectMode(CENTER);
  strokeWeight(1);
  stroke(255,0,0);
  //fill(255);
  noFill();
  sphere(50);
  popMatrix();
  
  // Update RED ball position, bounce if reach box edge (box is -350 to 350, ball is 50)
  rx=rx+rxs;
  if (rx > 350 || rx < -350) {
    rx=rx-rxs;
    rxs=-rxs;
  }

  ry=ry+rys;
  if (ry > 350 || ry < -350) {
    ry=ry-rys;
    rys=-rys;
  }

  rz=rz+rzs;
  if (rz > 750 || rz < 50) {
    rz=rz-rzs;
    rzs=-rzs;
  }

  
  // BLUE Bouncing ball
  pushMatrix();
  rotateX(-PI/8);
  translate(bx, by, bz);
  rectMode(CENTER);
  strokeWeight(1);
  stroke(50, 255, 255);
  //fill(255);
  noFill();
  sphere(50);
  popMatrix();

  // Update BLUE ball position, bounce if reach box edge (box is -350 to 350, ball is 50)
  bx=bx+bxs;
  if (bx > 350 || bx < -350) {
    bx=bx-bxs;
    bxs=-bxs;
  }

  by=by+bys;
  if (by > 350 || by < -350) {
    by=by-bys;
    bys=-bys;
  }

  bz=bz+bzs;
  if (bz > 750 || bz < 50) {
    bz=bz-bzs;
    bzs=-bzs;
  }
  
  // GREEN Bouncing ball
  pushMatrix();
  rotateX(-PI/8);
  translate(gx, gy, gz);
  rectMode(CENTER);
  strokeWeight(1);
  stroke(0, 255, 0);
  //fill(255);
  noFill();
  sphere(50);
  popMatrix();

  // Update GREEN ball position, bounce if reach box edge (box is -350 to 350, ball is 50)
  gx=gx+gxs;
  if (gx > 350 || gx < -350) {
    gx=gx-gxs;
    gxs=-gxs;
  }

  gy=gy+gys;
  if (gy > 350 || gy < -350) {
    gy=gy-gys;
    gys=-gys;
  }

  gz=gz+gzs;
  if (gz > 750 || gz < 50) {
    gz=gz-gzs;
    gzs=-gzs;
  }
  
  //check for collision between blue and red
  if ((abs(by-ry) < 50)&&(abs(bz-rz) < 50)&&(abs(bx-rx) < 50)) {
    txs = bxs;
    tys = bys;
    tzs = bzs;
    
    bzs=rzs;
    bxs=rxs;
    bys=rys;
    
    rzs=tzs;
    rxs=txs;
    rys=tys;
  }
  
  //check for collision between blue and green
  if ((abs(by-gy) < 50)&&(abs(bz-gz) < 50)&&(abs(bx-gx) < 50)) {
    txs = bxs;
    tys = bys;
    tzs = bzs;
    
    bzs=gzs;
    bxs=gxs;
    bys=gys;
    
    gzs=tzs;
    gxs=txs;
    gys=tys;
  }
  
  //check for collision between red and green
  if ((abs(gy-ry) < 50)&&(abs(gz-rz) < 50)&&(abs(gx-rx) < 50)) {
    txs = gxs;
    tys = gys;
    tzs = gzs;
    
    gzs=rzs;
    gxs=rxs;
    gys=rys;
    
    rzs=tzs;
    rxs=txs;
    rys=tys;
  }
}
