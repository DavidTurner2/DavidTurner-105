void setup() {
  size(800, 800);
  //frameRate(5);
  strokeCap(PROJECT);
}
float step;
float r = random(50,155);
float g = random(50,155);
float b = random(50,155);
float sizer = 0;

void draw() {
  background(0);
  step += 0.0009;
     stroke(255,0,0);
     strokeWeight(30);
     for(int j = 0; j<5; j++){
          point(lerp(-j*50+200,constrain(mouseX,300,800)-13,constrain(map(step*100,0,20,0,1),0,1)),lerp(-j*50+-50,600,constrain(sin(map(step*100,0,20,0,1)),0,1)));
     }
  noStroke();
  fill(lerp(0,r,abs(sin(step*4.0))),lerp(0,g,abs(sin(step*4.0))),lerp(0,b,abs(sin(step*4.0))));
  rect(constrain(mouseX,300,800),0,50+sizer,861);
  
 if(step*100>TAU*3.2&&step<TAU*5){
   if(frameCount%25==0){
 r = random(50,155);
 g = random(50,155);
 b = random(50,155);
   }
     sizer = random(10,40)*cos(step*90);
  
}
  
  
  translate(400, 400);
  rotate(step*100);  
  strokeWeight(9);
  for (int i =0; i<99; i++) {
    if (i>50) {
      stroke(200, 100);
      point(0, 400);
     
    } else {
      stroke(255, 90);
      point(i+0, 400);
    }
  }

  if (step*100>TAU*11.0) {
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
