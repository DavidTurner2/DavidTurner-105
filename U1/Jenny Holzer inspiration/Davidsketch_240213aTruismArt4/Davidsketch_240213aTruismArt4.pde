//inspired by jenny holzer truism
//code runs at start
void setup() {
  //declare pfont variable font
  PFont font;
  //set size to 1000,1000
  size(1000, 1000);
  //asign font i created to font variable
  font = loadFont("Impact-48.vlw");
  //set text font to font variable and size to 128
  textFont(font, 25);
  //set stroke weight to 5
  strokeWeight(5);
}
//code runs everyframe until noloop is called
void draw() {
  //set background to white
  background(255);
  //set starting destination for noise wave
  PVector dest1 = new PVector(250, 300);
  //set fill to semi transparent black
  fill(0, 50);
  //move the to -250
  translate(-250, 0);
  //loop where its incrimented by the length and it starts at 250
  for (float i = 250; i<2500; i+=7) {
    //set new random destination for line to travel to
    PVector dest = new PVector(random(5+i, 200), random(200, 600));
    //write quote from truism at random destination
    text("NOISE CAN BE HOSTILE", dest.x+i, dest.y);
    //make line go from old destination to new destination
    line(dest1.x, dest1.y, dest.x, dest.y);
    //turn new destination into old generation to loop again
    dest1.x = dest.x;
    dest1.y = dest.y;
  }
  //write quote if the randomness doesnt let you see the quote
  text("NOISE CAN BE HOSTILE", 500, 100);
  //stop the loop
  noLoop();
}
//code runs when mouse pressed
void mousePressed() {
  //save file as png
  save(this + ".png");
}
