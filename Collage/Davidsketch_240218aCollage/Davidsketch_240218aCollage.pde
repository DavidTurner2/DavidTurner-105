//add comments
PImage[] ki;
void setup(){
  size(474,527);
PImage[] image = {loadImage("avatargrind.png"),
loadImage("loop.png"),
loadImage("jump.png"),
loadImage("spikes.png"),
loadImage("platform.png"),
loadImage("spike.png"),
loadImage("idk.jpg"),
loadImage("loop.png"),
loadImage("idk.jpg"),
loadImage("loop.png")};
ki = image;
}


void draw(){
  background(ki[6]);
  image(ki[0],-4,334);
  image(ki[1],-36,-86);
  image(ki[2],-23,-6);
  image(ki[3],411,10);
  image(ki[4],-18,425);
  image(ki[5],305,298);

}
