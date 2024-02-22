//add comments

PImage ultra;
PImage s;
PImage m;
PImage bg;

void setup(){
  size(700,700);
  ultra = loadImage("moron.png");
  s = loadImage("sonic.jpeg");
  m = loadImage("mephiles.jpeg");
  bg = loadImage("bg.jpeg");
}

void draw(){
  background(0);
  PVector size =  new PVector(1705,1219);
  float size1 = 420;
  float size2 = 433;
  float size3 = 359;
  image(bg,-840,-420,size.x,size.y);
  image(m,-84,111,size2,size2);
  image(s,227,356,size3,size3);
  rotate(-0.28);
  image(ultra,239,180,size1,size1);

}

void mousePressed(){
  save(this+".png");
}
