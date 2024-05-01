//inspired by Album cover from Traditional Synthesizer Music by Venetian Snares - https://venetiansnares.bandcamp.com/album/traditional-synthesizer-music
//create global variable
PFont font;
//code runs at start
void setup() {
  //set size to 1000,940
  size(1000, 940);
  //load font and assign it to global variable
  font = loadFont("FranklinGothic-Medium-48.vlw");
}
//code runs every frame until noloop function is called
void draw() {
  //set background to tinted white
  background(#f3f4ec);
  //turn off stroke
  noStroke();
  fill(35);
  textFont(font, 57);
  //make black square
  square(0, 260, 5902);
  //draw album title
  text("Traditional Synthesizer Music", 54, 158);
  fill(#64afa0);
//album author in blue green
  text("Venetian Snares", 53, 115);
//white label art shapes
  fill(222);
  rect(33, 866, 11, 42, 0, 0, 0, 30);
  arc(60, 880, 23, 23, TAU * 0.25, TAU * 0.75, PIE);
  arc(64, 894, 23, 23, TAU * 0.75, TAU * 1.25, PIE);
  fill(253,82);
  //small label author text
  textFont(font, 8);
  text("TIMESIG005", 34, 922);
//green yellowish circle thats on a row not connected to the other circles
  fill(#7fb24a);
  circle(480, 850, 80);
  fill(#6db063);
  //loops for creating diagonal rows of  circles that are the same color
  for (int i = 0; i < 2; i++) {
    circle(560+i*80, 770+i*80, 80);
  }
  fill(#70b3a0);
  for (int i = 0; i < 3; i++) {
    circle(560+i*80, 690+i*80, 80);
  }
  fill(#62a0af);
  for (int i = 0; i < 4; i++) {
    circle(560+i*80, 610+i*80, 80);
  }
  fill(#58739e);
  for (int i = 0; i < 5; i++) {
    circle(560+i*80, 530+i*80, 80);
  }
  fill(#575c93);
  for (int i = 0; i < 5; i++) {
    circle(560+i*80, 450+i*80, 80);
  }
  fill(#695c92);
  for (int i = 0; i < 5; i++) {
    circle(560+i*80, 370+i*80, 80);
  }
  fill(#7d5c8f);
  for (int i = 0; i < 4; i++) {
    circle(640+i*80, 370+i*80, 80);
  }
  fill(#955c8f);
  for (int i = 0; i < 3; i++) {
    circle(720+i*80, 370+i*80, 80);
  }
  fill(#b05274);
  for (int i = 0; i < 2; i++) {
    circle(800+i*80, 370+i*80, 80);
  }
  //orange circle top right
  fill(#b15c48);
  circle(880, 370, 80);
  
  //dark grey semi transpatent text for stereo
  fill(40,195);
  textFont(font,30);
  text("STEREO",856,40);
  //stroke to black and stroke weight to 1.4
  stroke(0);
    strokeWeight(1.4);
    //turn off fill
  noFill();
  //rectangle that holds noise wave
rect(856,55,100,20);
//rectangle that holds sawtooth wave
rect(856,81,100,20);
//rectangle that holds triganle wave
rect(856,107,100,20);
//rectangle that holds square wave
rect(856,133,100,20);
//rectangle that holds sine wave
rect(856,159,100,20);
//sawtooth wave
strokeWeight(1.6);
line(856,91,871,84);
line(871,85,871,98);
line(904,85,871,99);
line(904,85,904,98);
line(904,99,938,85);
line(938,85,938,98);
line(938,99,956,91);
//triangle wave
line(856,117,866,109);
line(867,109,882,124);
line(882,124,898,109);
line(898,109,914,124);
line(914,124,930,109);
line(931,109,945,124);
line(946,124,956,115);
//square wave
for(int i = 0 ; i<3*32; i+=34){
line(856 + i,137,871 + i,137);
line(871 + i,150,888 + i,150);
line(871 + i,137,871 + i,150);
}
for(int i = 0 ; i<2*32; i+=34){
line(889 + i,137,889 + i,150);
}
//sine wave
for(float i = 0 ; i<99; i+=0.46){
  point(857 + i,170+-7*sin(i * PI/16.6));
}
//turn weight to 1.2
strokeWeight(1.2);

//noise wave
  PVector dest1 = new PVector(255, 203);
  //move the to -250
  translate(602, -136);
  //loop where its incrimented by the length and it starts at 250
  for (float i = 250; i<350; i+=1.5) {
    //set new random destination for line to travel to
    PVector dest = new PVector(random(5+i, 100), random(191, 210));
    //write quote from truism at random destination
    //make line go from old destination to new destination
    line(dest1.x, dest1.y, dest.x, dest.y);
    //turn new destination into old generation to loop again
    dest1.x = dest.x;
    dest1.y = dest.y;
  }
  //turn off loop to stop noise wave
  noLoop();
}
//code runs when the mouse is pressed
void mousePressed(){
  //save as png
  save(this + ".png");
}
