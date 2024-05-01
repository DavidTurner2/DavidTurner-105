//Screenshot of Sonic from Sonic Frontiers - SEGA
//Artwork of Boo from Mario Party: Island Tour - Nintendo

//make global pimage variables to store images
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image7;
PImage image8;

//code runs at start
void setup() {
  size(700, 700); // set size to 700,700
  //assign images loaded from data folder to the global variables
  image2 = loadImage("loop.png");
  image3 = loadImage("jump.png");
  image4 = loadImage("spikes.png");
  image5 = loadImage("platform.png");
  image7 = loadImage("spike.png");
  image8 = loadImage("boo.png");
}


//code runs every frame
void draw() {
  //set background to black
  background(0);
  //make these images opaque
  tint(255, 255);
  image(image7, -36, -86);
  image(image7, 100, -86);
  image(image4, -23, -6);
  image(image5, 411, 10);
  image(image3, -18, 425);
  image(image2, 305, 298);
  //save this matrix
  pushMatrix();
  //rotate this ghost image
  rotate(37.2);
  image(image8, 324, 405, 100, 100);
  //revert matrix so the images below dont get rotated
  popMatrix();
  //make 3 ghosts at different transpancy levels
  tint(255, 100);
  image(image8, 200, 0, 300, 300);
  tint(255, 150);
  image(image8, 400, 300, 300, 300);
  tint(255, 70);
  image(image8, 0, 300, 300, 300);
}

//code runs when mouse is pressed
void mousePressed() {
  //save screenshot as png
  save(this+".png");
}
