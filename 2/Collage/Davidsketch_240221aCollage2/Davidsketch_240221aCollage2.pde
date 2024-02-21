PImage ultra;
PImage s;
PImage m;

void setup(){
  size(700,700);
  ultra = loadImage("moron.png");
  s = loadImage("sonic.jpeg");
  m = loadImage("mephiles.jpeg");
}

void draw(){
  background(0);
  float size1 = 420;
  float size2 = 433;
  float size3 = 359;
  image(ultra,305,111,size1,size1);
    image(m,-84,111,size2,size2);
  image(s,188,356,size3,size3);

}
