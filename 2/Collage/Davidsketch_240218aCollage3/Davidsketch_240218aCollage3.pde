//add comments
PImage image;
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image6;
PImage image7;
PImage image8;

void setup(){
  size(900,527);
image = loadImage("avatargrind.png");
 image2 = loadImage("loop.png");
 image3 = loadImage("jump.png");
 image4 = loadImage("spikes.png");
 image5 = loadImage("platform.png");
 image6 = loadImage("spike.png");
 image7 = loadImage("idk.jpg");
 image8 = loadImage("boo.png");
}



void draw(){
  background(0);
  tint(255,255);

  image(image,-4,334);
  image(image6,-36,-86);
  image(image4,-23,-6);
  image(image5,411,10);
  image(image3,-18,425);
  image(image2,305,298);
  tint(255,255);
  image(image8,200,0,300,300);
 

  /*
  tint(255,200);
  image(image8,400,300,300,300);
  tint(255,20);
  image(image8,0,300,300,300);
*/
}

void mousePressed(){
  save(this+".png");
}
