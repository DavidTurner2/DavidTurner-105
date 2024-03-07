//Screenshot of Sonic from Sonic Frontiers - SEGA
//Screenshot of My Avatar from Sonic Forces - SEGA

//add comments
PImage[] ki;
void setup() {
  size(900, 800);
  PImage[] image = {loadImage("avatargrind.png"),
    loadImage("loop.png"),
    loadImage("jump.png"),
    loadImage("spikes.png"),
    loadImage("platform.png"),
    loadImage("spike.png"),
    loadImage("star.png")};
  ki = image;
}


void draw() {
  background(#bbffff);
  tint(255, 255);
  image(ki[3], 500, 300);
  image(ki[0], -4, 334);
  image(ki[1], -36, -86);
  image(ki[4], -18, 425);
  image(ki[5], 305, 298);
  tint(255, 240);
  image(ki[6], 450, 200);
  for (int i =0; i<40; i++) {
    tint(255, i*6.37);
    image(ki[2], -23+i*4, -6);
  }
}

void mousePressed() {
  save(this+".png");
}
