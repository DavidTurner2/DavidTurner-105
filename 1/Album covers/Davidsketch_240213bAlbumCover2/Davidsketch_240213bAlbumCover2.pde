//inspired by the album cover from do you know squarepusher by square pusher 
//https://squarepusher.bandcamp.com/album/do-you-know-squarepusher
//code runs at start
void setup(){
  //set size to 1000,1000
  size(1000,1000);
  //declare pfont variable called font
  PFont font;
  //assign font the loadfont data
  font = loadFont("SquareDance00-48.vlw");
  //set text font to font i loaded and size to 28
  textFont(font,28);
  //no stroke
  noStroke();
}
//code runs every frame
void draw(){
  //set background to black
 background(0);
 //set fill to white
 fill(255);
 //draw big square
 square(260,260,777);
 //set fill to black
 fill(0);
 //write title trying to emulate the album's font a little bit
 text("d",534,990);
 text("o you know squarepusher",550,990);
 //set fill to white
 fill(255);
 //save the matrix before rotating
 pushMatrix();
 //rotate smaller square
 rotate(PI * -0.25);
 square(-130,250,264);
 //pop matrix revert rotation for code on top
  popMatrix();
}
//code that runs when mouse is pressed
void mousePressed(){
  //save as png
  save(this + ".png");
}
