/*
Inspired by Verena Loewensberg
Untitled - 1981 https://www.wikiart.org/en/verena-loewensberg/untitled-1981
*/
//code runs at the start
void setup(){
  //set size to 500,500 and get rid of stroke
  size(500,500);
  noStroke();
}
//code that runs every frame
void draw(){
  //make a background so it doesnt look weird when tweaking
  background(0);
  //top half of background rectangles 4 pillers
  fill(#418d74);
  rect(0,0,125,556);
  fill(#2258b6);
  rect(125,-2,250,556);
  fill(#972928);
  rect(250,-2,375,556);
  fill(#418d74);
  rect(375,-2,500,556);
  //bottom half of background 4 pillers
    fill(#2258b6);
  rect(0,375,125,556);
    fill(#972928);
  rect(125,375,250,556);
    fill(#418d74);
  rect(250,125,250,556);
      fill(#2258b6);
   rect(375,125,500,556);
//quadralateral in middle
fill(#ced0cd);
quad(250,375,0,375,250,125,500,125);
}
//function that runs when mouse is pressed on window
void mousePressed() {
  //save the screen as a png file
  save("InspiredArt.png");
}
