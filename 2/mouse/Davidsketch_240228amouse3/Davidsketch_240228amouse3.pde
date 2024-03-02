//add comments
void setup() {
  size(800, 700);
  rectMode(CENTER);
  frameRate(60);
}
float saved= 0;
float move = 0;
float o = random(2);
float first = random(255);
float stop = random(200, 255);
String text = "stop looking at me";
String[] texts = {"hi my name is johnny", "im the secret character",
  "CHAR:99", "please stop", "stop looking at me"};
void draw() {
  background(0);
  fill(stop, mouseX/3.9, mouseY/2.9, random(200));
  text(text, mouseX-50, mouseY-20);

  if (move==-800) {
    text = "DENIED";
    o = random(2);
    move = 0;
    first =random(255);
  }

  if (frameCount%50==0) {
    stop = random(200, 255);
    //so that its the same shade of colors
    stroke(random(first), 0, 20, 255);
    text = texts[int(random(texts.length))];
  }
  translate(move, 300);

  if (mouseX>350) {
    move-=2;
  } else {
    move+=2;
  }

if(move==800){
  text = "DENIED";
   o = random(2);
    move = 0;
    first =random(255);
}
  strokeWeight(30.51);
  float max = 1600;
  for (float i = 0; i<max; i+=0.9) {
    point(0 + i, 170+-9* tan(2*(frameCount/9.009*i * PI/16)));
    point(0 + i, 170+-9*sin(i * PI/o));
    rotate(i);
  }
}
