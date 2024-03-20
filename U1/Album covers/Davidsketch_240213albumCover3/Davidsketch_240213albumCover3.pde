//inspired by album cover endless by holding patterns https://holdingpatterns.bandcamp.com/album/endless
//add commments
//code runs at start
void setup() {
  //declare pfont variable font
  PFont font;
  //assign font the font in the data folder
  font = loadFont("Arial-BoldMT-48.vlw");
  //set text font to the font i loaded and assigned and size to 32
  textFont(font,32);
  //set window size to 1000,1000
  size(1000, 1000);
}
//code runs everyframe
void draw() {
  //set background to tinted grey
  background(#b9bab2);
  //make black text and white text for album title and author
  fill(0);
  text("holding \npatterns",840,75);
  fill(255);
  text("endless",840,150);
  //push matrix to save rotation
  pushMatrix();
  //make tilted square and sine waves
  rotate(PI * 0.16);
  //variables to adjust them both when i do the rotation
  float adjustx = 220;
  float adjusty = -276;
  //red square
  fill(#be302e);
  square(157 + adjustx,150+ adjusty,648);
  //black stroke stroke weight 8
  stroke(0);
  strokeWeight(8);
  //loop that makes multiple sine waves
  for(int j = 0; j<4;j++){
    //loop that makes sine waves
  for(float i = 0 ; i<735; i+=0.40){
  point(529+ adjustx + i,j*42+ adjusty + 327+14*sin(i * PI/29.5));
  }
}
//revert matrix so rotation doesnt affect the code below and the album title
popMatrix();  
  
  //semi transparent black fill
  fill(0, 220);
  noStroke();
  //create black shapes from cover 
  //circle top right
  circle(100, 100, 335);
  //rectangles bottom left
  for (int i = 0; i<3 * 130; i+= 132) {
    rect(0 + i, 822, 89, 370);
  }
  //rectangles top
  for (int i = 0; i<4 * 64; i+=64) {
    if (i ==64*2) {
      rect(555 + i, 190, 42, -326);
    } else if (i==64) {
      rect(555 + i, 190 + i/1.01, 42, -326);
    } else {
      rect(555 + i, 190 + i/1.12, 42, -366);
    }
  }
  //triangle bottom
  triangle(720,1000,842,781,967,1000);  
}
//code runs when mouse is pressed
void mousePressed(){
  //save as png
  save(this + ".png");
}
