//inspired by Georgia O'Keeffe
//Black Lines 1 - 1916 https://www.wikiart.org/en/georgia-o-keeffe/black-lines-1
//code runs at start
void setup(){
  //set size to 500,500
  size(500,500);
}
//code runs every frame
void draw(){
  //set background to grey white
  background(240);
  //set stroke weight to to different weights while trying to draw the bottom lines
  strokeWeight(9);
  line(200,500,350,500);
  strokeWeight(11);
  line(100,490,400,490);

//drawing the second line with different weights
  strokeWeight(1);
  line(334,900,336,14);
  strokeWeight(3);
  line(336,350,336,100);
  strokeWeight(4.35);
  line(335.5,300,336,100);
  strokeWeight(2.35);
  line(339,300,338,100);
  //draw the first line that goes diagonally with different weights
  strokeWeight(1);
  line(310,900,310,200);
  line(310,200,260,280);
  line(260,280,260,150);
  strokeWeight(4);
  line(260,280,260,170);
}
//code runs when mouse is pressed
void mousePressed(){
  //save as png
  save(this + ".png");
}
