//code runs at start
void setup() {
  size(700, 700); // set size to 700,700
  background(0); // set background to black
}
//array of rgb color values
color[] w = {255, 123, 255, 123, 123, 50, 255, 67};

//code runs every frame
void draw() {
  //set stroke cap to project to make points look like squares
  strokeCap(PROJECT);

  //if frame count is divisable by 3 put random squares and random colors from the global array of rgb color values
  if (frameCount%3==0) {
    strokeWeight(30);
    float y =  random(700);
    for (int i = 0; i<60; i++) {
      stroke(lerpColor(w[int(random(w.length-1))], w[int(random(w.length-1))], w[int(random(w.length-1))]), #ff0000, random(255), i);
      point(random(-100, 700) + i, y);
    }
  }
  //translate everything on the bottom to 350,350
  translate(350, 350);
  //scale everything on the bottom to 0.50
  scale(0.50);
  //draw weird blue lines with trigonemtric functions and loop to make lots of them appear
  for (int i = 0; i<134; i++) {
    stroke(0, 0, random(200, 236), random(150, 206));
    strokeWeight(random(5));
    //roatate by framecount divided by 99
    rotate(frameCount/99);
    line(random(200) * cos(frameCount), 99*tan(frameCount), random(200) * cos(frameCount), 99*tan(frameCount));
  }
}
