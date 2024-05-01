//inspired by jenny holzer truism
//code runs at start
void setup() {
  //declare pfont variable font
  PFont font;
  //set size to 1000,1000
  size(1000, 1000);
  //asign font i created to font variable
  font = loadFont("ChillerStd-48.vlw");
  //set text font to font variable and size to 25
  textFont(font, 25);
}
//code runs everyframe
void draw(){
  //set background to black
  background(0);
  //loop binary code going down and fill go dark green to light
  for(int i = 0; i<5*100; i+=88){
     fill(0,i/2+56,0);
  text("\n01010100 01000101 01000011 01001000 01001110 01001111 01001100 01001111 01000111 01011001 00100000 01010111 \n01001001 01001100 01001100 00100000 01001101 01000001 01001011 01000101 00100000 01001111 01010010 00100000 \n01000010 01010010 01000101 01000001 01001011 00100000 01010101 01010011 00111111 00111111 00111111 00111111 0000000",2,0 + i);
  }
  //loop binary code going up and fill go dark green to light
  for(int i = 0; i<5*100; i+=90){
     fill(0,i/2+56,0);
  text("\n01010100 01000101 01000011 01001000 01001110 01001111 01001100 01001111 01000111 01011001 00100000 01010111 \n01001001 01001100 01001100 00100000 01001101 01000001 01001011 01000101 00100000 01001111 01010010 00100000 \n01000010 01010010 01000101 01000001 01001011 00100000 01010101 01010011 00111111 00111111 00111111 00111111 0000000",2,1000 - i);
  }
  //write quote in text 
  text("TECHNOLOGY WILL MAKE OR BREAK US TECHNOLOGY WILL MAKE OR BREAK US TECHNOLOGY WILL MAKE OR BREAK US TECHNOLOGY WILL MAKE OR BREAK US",4,550);
}

//code runs when mouse is pressed
void mousePressed(){
  //save file as png
  save(this + ".png");
}
