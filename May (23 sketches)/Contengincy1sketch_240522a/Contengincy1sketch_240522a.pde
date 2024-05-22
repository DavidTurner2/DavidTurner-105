//inspired by album cover cluster by curiosum https://music.apple.com/us/album/curiosum/1184954117
void setup() {
  size(800, 800);
  strokeCap(PROJECT);
}

void draw() {

  background(239);
  pushMatrix();
  translate(0, 0);
  rotate(0.13);
  fill(#046ddb);
  textSize(56);
  text("CLUSTER", 579, -9);
  textSize(36);

  fill(#5ee31f);
  text("curiosum", 627, -56);
  popMatrix();
  stroke(#e4f10d);
  strokeWeight(13);
  line(614, 548, 626, 138);
  strokeWeight(39);
  line(613, 148, 0, 122);

  noStroke();

  fill(#fd8248);
  circle(600, 645, 170);
  fill(#72f52f);
  triangle(501, 231, 120, 219, 295, 560);
  rotate(-0.27);
  stroke(#1a9ee8);
  strokeWeight(5);

  for (float i = 0; i<23; i+=0.8) {

    point(-71+i, 617+4*sin(i/3.80));
  }
}
