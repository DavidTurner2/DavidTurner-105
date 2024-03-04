void setup() {
  size(800, 800);
  //frameRate(5);
}
float step;
boolean shoot1 = false;

void draw() {
  background(0);
  step += 9/9.0009;
  if(shoot1 == true){
      stroke(255,0,0);
     strokeWeight(30);
     point(298,761-frameCount);
     
  }
 if(step>TAU&&step<TAU*2){
   println("ewrer");
shoot1 = true;
}
  
  
  translate(400, 400);
  rotate(step/24);  
  strokeWeight(9);
  for (int i =0; i<99; i++) {
    if (i>50) {
      rotate(step);
      stroke(200, 100);
      point(0, 400);
     
    } else {
      stroke(255, 90);
      point(i+0, 400);
    }
  }

  if (step>PI*48) {
    step = 0;
  }
}


void spawner(float x,float y){
     stroke(255,0,0);
     strokeWeight(30);
     point(x,y);
   
}

void mousePressed(){
  stroke(255,0,0);
     strokeWeight(30);
     point(298,761);
}
