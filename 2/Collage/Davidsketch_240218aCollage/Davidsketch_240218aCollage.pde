//add comments
PImage[] ki;
void setup(){
  size(900,800);
PImage[] image = {loadImage("avatargrind.png"),
loadImage("loop.png"),
loadImage("jump.png"),
loadImage("spikes.png"),
loadImage("platform.png"),
loadImage("spike.png"),
loadImage("star.png")};
ki = image;
}


void draw(){
  background(#bbffff);
  image(ki[3],500,300);
  image(ki[0],-4,334);
  image(ki[1],-36,-86);
  image(ki[2],-23,-6);
  image(ki[4],-18,425);
  image(ki[5],305,298);
  image(ki[6],450,200);

}

void mousePressed(){
  save(this+".png");
}
