/* inspired by Max bill
Untitled - 1971 https://www.wikiart.org/en/max-bill/untitled-1971
*/
//function that runs at start 
void setup(){
  //set window size to 500,500 and remove the stroke

  size(500,500);
  noStroke();
}
//function that runs every frame
void draw(){
  //set background to the color 255
  background(255);
  //create squares to be cutoff in the shape
  fill(#dbacc9);
 square(87,140,250);
  fill(#6736a2);
 square(146,85,250);
  fill(#187dc0);
 square(189,140,250);
   fill(#027736);
 square(160,222,217);
  fill(#f6e24a);
   square(138,140,250);
//create middle square
  fill(#f1710a);
  square(175,175,175);
//create white squares to cut off the colors to make a diagnal shape
  pushMatrix();
  rotate(TAU * 1.126);
  fill(255);
  square(-4,-128,250);
    square(496,-128,250);
  square(246,122,250);
  square(246,-378,250);
  popMatrix();
}
  //function that runs when mouse is pressed on window
void mousePressed() {
  //save the screen as a png file
  save("InspiredArt.png");
}
