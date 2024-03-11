//Screenshot of Sonic from Sonic Frontiers - SEGA
//Screenshot of My Avatar from Sonic Forces - SEGA

PImage[] ki; //make gloabal image array varriable

//code runs at start
void setup() {
  size(900, 800); // set size to 900,800
  //load images into an array
  PImage[] image = {loadImage("avatargrind.png"),
    loadImage("loop.png"),
    loadImage("jump.png"),
    loadImage("spikes.png"),
    loadImage("platform.png"),
    loadImage("spike.png"),
    loadImage("star.png")};    
  ki = image; //assign gloabal varriable these images
}

//code runs every frame
void draw() {
  //set background to light blue
  background(#bbffff);
  //make images opaque
  tint(255, 255);
  image(ki[3], 500, 300);
  image(ki[0], -4, 334);
  image(ki[1], -36, -86);
  image(ki[4], -18, 425);
  image(ki[5], 305, 298);
//make this star semi transparent
  tint(255, 240);
  image(ki[6], 450, 200);
  //make transparent trail image using loop
  for (int i =0; i<40; i++) {
    tint(255, i*6.37);
    image(ki[2], -23+i*4, -6);
  }
}
//code runs when mouse is pressed
void mousePressed() {
  //save screenshot as a png
  save(this+".png");
}
