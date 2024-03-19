//code runs at start
void setup() {
  //set size to 800,700
  size(800, 700);
  //set rectangle mode to center
  rectMode(CENTER);
  //set frame rate to 60
  frameRate(60);
}
//variable for moving
float move = 0;
//variable for the first color
float shade = random(255);
//variable for the stop color
float stop = random(200, 255);
//text that gets replaced with text from string array
String text = "stop looking at me";
//array of text
String[] texts = {"hi my name is johnny", "im the secret character",
  "CHAR:99", "please stop", "stop looking at me"};
//code runs everyframe
void draw() {
  //set background to black
  background(0);
  //set fill to stop color and a mouse x/ mouse y position
  fill(stop, mouseX/3.9, mouseY/2.9, random(200));
  //display text on mouse x and y shifted so the cursor doesnt block the text
  text(text, mouseX-50, mouseY-20);
  //if you go out of bounds
  if (move==-800) {
    //make text breifly display "denied" then telepot you back make shade color random
    text = "DENIED";
    move = 0;
    shade =random(255);
  }

  //when frame count divisible by 50
  if (frameCount%50==0) {
    stop = random(200, 255);
    //so that its the = or less shade of colors if its low or high
    stroke(random(shade), 0, 20, 255);
    text = texts[int(random(texts.length))];
  }
  //move based on move variable
  translate(move, 300);
  //use mouse x to control movement
  if (mouseX>350) {
    move-=2;
  } else {
    move+=2;
  }
  //if you go out of bounds the other way
  if (move==800) {
    //make text breifly display "denied" then telepot you back make shade color random
    text = "DENIED";
    move = 0;
    shade =random(255);
  }
  //set big stoke weight and mkae spiralling thing that gets affected by stroke color above
  strokeWeight(30.51);
  float max = 1600;
  for (float i = 0; i<max; i+=0.9) {
    point(0 + i, 170+-9* tan(2*(frameCount/9.009*i * PI/16)));
    point(0 + i, 170+-9*sin(i * PI/2));
    rotate(i);
  }
}
