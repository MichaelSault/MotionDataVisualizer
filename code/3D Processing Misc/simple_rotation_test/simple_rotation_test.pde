float rotAngleX = 0;
float rotAngleY = 0;
float rotAngleZ = 0;
float swap = 0; 

void setup(){
  size(500, 500, P3D);
}

void draw(){
  background(255);
  translate(width/2, height/2, 0);
  
  if (swap == 1){
      rotateX(rotAngleX);
      rotateY(rotAngleY);
      rotateZ(rotAngleZ);
      rotAngleX+=0.01;
    }else if (swap == 2){
      rotateX(rotAngleX);
      rotateY(rotAngleY);
      rotateZ(rotAngleZ);
      rotAngleY+=0.01;
    } else if (swap == 3){
      rotateX(rotAngleX);
      rotateY(rotAngleY);
      rotateZ(rotAngleZ);
      rotAngleZ+=0.01;
    } else if (swap == 0){
      rotateX(rotAngleX);
      rotateY(rotAngleY);
      rotateZ(rotAngleZ);
    }
  box(200, 200, 200);
  fill(250, 100, 20);
  strokeWeight(10);
  rectMode(CENTER);
}

void mouseClicked(){
   if (swap == 0){
      swap = 1;
    }else if (swap == 1){
      swap = 2;
    }else if (swap == 2){
      swap = 3;
    } else if (swap == 3){
      swap = 0;
    }
}
