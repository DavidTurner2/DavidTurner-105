//Screenshot of Sonic from Sonic Frontiers - SEGA
//Artwork of Boo from Mario Party: Island Tour - Nintendo
//add comments
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image7;
PImage image8;

void setup() {
  size(700, 700);
  image2 = loadImage("loop.png");
  image3 = loadImage("jump.png");
  image4 = loadImage("spikes.png");
  image5 = loadImage("platform.png");
  image7 = loadImage("spike.png");
  image8 = loadImage("boo.png");
}



void draw() {
  background(0);
  tint(255, 255);
  image(image7, -36, -86);
  image(image7, 100, -86);
  image(image4, -23, -6);
  image(image5, 411, 10);
  image(image3, -18, 425);
  image(image2, 305, 298);
  pushMatrix();
  rotate(37.2);
  image(image8, 324, 405, 100, 100);
  popMatrix();
  tint(255, 100);
  image(image8, 200, 0, 300, 300);
  tint(255, 150);
  image(image8, 400, 300, 300, 300);
  tint(255, 70);
  image(image8, 0, 300, 300, 300);
}

void mousePressed() {
  save(this+".png");
}
