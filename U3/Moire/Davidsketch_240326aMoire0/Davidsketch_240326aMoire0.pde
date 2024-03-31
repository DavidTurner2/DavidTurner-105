//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
}
//code runs everyframe
void draw() {
  //set background to pink
  background(215, 55, 100);
  //turn off fill
  noFill();
  //SET stroke to black
  stroke(0);
  //set stroke weight to 25
  strokeWeight(25);
  //make an elipse stretching and thing
  ellipse(30*sin(frameCount/9.0390293)+400, 400, 700*sin(frameCount/23.09), 400*cos(frameCount/99.09));
  //make arc being doing those things
  for (int i=20; i>0; i--) {
    strokeWeight(i);
    arc(20*sin(frameCount/9.09+i)+399+i*2.4, 400+i*2.4, 100, 400, radians(-300*abs(sin(frameCount/99.009))), radians(200*sin(frameCount/99.009)));
  }
  //set fill to black
  fill(0);
  //text size to 30
  textSize(30);
  //push
  pushMatrix();
  //loops for squares and text
  for (int i = 0; i<20; i++) {
    text("SKULL EMOJI MOIRE", 400+100*abs(sin(-frameCount/100.23242)), 400);
    //go up and down
    square(-200*abs(sin(-frameCount/100.23242))+i*60, 300+400*sin(frameCount/80.009), 40);
    square(-200*abs(sin(-frameCount/100.23242))+i*60, 800+400*-sin(frameCount/80.009), 40);
    square(-200*abs(sin(-frameCount/100.23242))+i*60, 100+400*abs(cos(frameCount/80.009)), 40);
    square(-200*abs(sin(-frameCount/100.23242))+i*60, 400+400*-cos(frameCount/80.009), 40);
   //bend
    rotate(-0.01*sin(frameCount/99.0390293));
  }
  popMatrix();
  //make stroke weight go up and down slightly mapping sine wave
  strokeWeight(1);
  //set stroke to yellow
  stroke(255, 255, 100, 220);
  //make lines overlap
  for (int i = 0; i<300; i++) {
    line(0+i*2, 0, 230+i*2, 9999);
    line(0, 0+i*2, 9999, 0+i*2);
  }
}
