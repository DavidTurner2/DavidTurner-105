void setup() {
  size(800, 800);
}
float step = 0;
void draw() {
  step +=0.07;
  background(100, 31, 2);
  
scale(0.5+0.125*sin(step));
translate(map(sin(step),-1,1,0,-1600),map(sin(step),-1,1,0,-100));
for(int i = 0; i<10; i++){
  strokeWeight(0);
  fill(73, 200, 73,i*25);
  ellipse(i*200+400+100*cos(step/2), 400+100*tan(step), 400, sin(step)*200);
  strokeWeight(100);
  stroke(0, 200, 0,i*25);
  ellipse(i*200+400+100*sin(step), 400+100*1/tan(step), sin(step)*400, 100);
  strokeWeight(200);  
  stroke(200, 23, 24,i*25);
  ellipse(i*200+400+100*1/cos(step/4), 400+100*1/sin(step/8), 400, 100);
}

if(step>TAU*8.0){
 // noLoop();
 step = 0; 
}
}
