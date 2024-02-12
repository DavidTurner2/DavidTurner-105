//code runs at start
void setup(){
  //declare pfont variable font
  PFont font;
  //set size to 1000,1000
 size(1000,1000); 
 //asign font i created to font variable
 font = loadFont("Papyrus-Regular-48.vlw");
 //set text font to font variable and size to 128
textFont(font, 128);
}
//code runs every frame
void draw(){
  //set background to black
  background(0);
  //write the quote from truism
  text("eating too much is \ncriminal",1,200);
  //set stroke to white
  stroke(255);
  //do some sine roatation with lines and the quote for stange effect
  for (int i = 0; i< 15; i++){
    rotate(sin(i));
  line(0,500,1900,500);
    text("eating too much is \ncriminal",500,800);

  }
}
//code runs when mouse pressed
void mousePressed(){
 //save file as png
 save(this + ".png");
}
