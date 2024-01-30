/*inspired by Gottfried Honegger
Gottfried Honegger - Tableau relief/Komposition Z.972 Year 1988 https://www.wikiart.org/en/gottfried-honegger/komposition-z-972-1988
*/
//function that runs at start 
void setup(){
  //set window size to 1000,1000 and the stroke cap to square
  size(1000,1000);
  strokeCap(SQUARE);
}
//function that runs every frame
void draw(){
 //set background to the color 231
 background(231);
 //set stroke weight to (1)
 strokeWeight(1);
 //put lines at the corrdinates to make an unfinised square
 line(250,250,750,250);
 line(750,750,750,250);
 line(250,750,750,750);
 //set stroke weight to (15)
 strokeWeight(15);
 //put 2 lines, 1 that completes the square but goes pass it and keep going up and another one that goes down on the bottom of the other side of the unfinished square
 line(244,750.5,244,0);
 line(743.5,1000,743.5,750);
}
  //function that runs when mouse is pressed on window
void mousePressed() {
  //save the screen as a png file
  save("InspiredArt.png");
}
