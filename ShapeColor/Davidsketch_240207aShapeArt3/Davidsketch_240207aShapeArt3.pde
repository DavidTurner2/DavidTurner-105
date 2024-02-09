/*inspired by Frank Stella
Harran II - 1967 https://www.wikiart.org/en/frank-stella/harran-ii-1967
*/
//code that runs at start set size 
void setup() {
  size(600, 280);
}
//code runs everyframe
void draw() {
  //make it look like the arcs from the ring of the other arcs continue pass the overlapping arcs
  background(255);
  stroke(240);
  strokeWeight(0.5);
  fill(#4b5b63);
  square(306,158,112);
  fill(#f4dc9d);
  square(174,-91,136);
  //bottom right arc
  Arc(#8d5f1c, #959a52, #c87b03, #211a3c, #a13a18, #706148, #1b1718, 0.50, 1.00, 0, 450, 270, -1);
  //right arc of center ring
  Arc(#4b5b63, #c44217, #aa915e, #243e75, #926935, #56844a, #b5181c, 0.75, 1.25, 1.51, 316, 140, 0);
  //left arc of center ring
  Arc(#c12e3f, #331e12, #4d4d87, #756453, #9e3259, #dfb902, #4b71ac, 1.25, 1.75, 1.10, 302, 140, 0);
  //top left arc
  Arc(#f4dc9d, #218a30, #c5ba56, #b30c35, #394e90, #c9375f, #8e816f, 1.00, 1.50, 0, 167, 9, -1.5);
 // shapes overlayed ontop of arcs
  noFill();
  //organge square
  stroke(#d98000);
  strokeWeight(15.0);
  square(173, 7, 129);
  //light purple arc
  stroke(#a4a0c3);
  strokeWeight(14.4);
  arc(162, 7, 248, 262, TAU * -0.75, TAU * -0.50, PIE);
  //red arc
  stroke(#a4072f);
  strokeWeight(14.5);
  arc(459, 273, 246, 263, TAU * -0.25, TAU * 0.00, PIE);
  //dark red arc
  stroke(#5d2239);
  strokeWeight(14.0);
  arc(303, 147, 256, 252, TAU * -0.75, TAU * -0.50, PIE);
  //greyish bornw square
  stroke(#847c52);
  strokeWeight(14.2);
  square(316, 143, 129);
  //dark blue arc
  stroke(#203a3a);
  strokeWeight(14.9);
  arc(315, 133, 263, 252, TAU * -1.25, TAU * -1.00, PIE);
}
//save image
void mousePressed() {
  save(this + ".png");
}
//custom Arc  funtcion makes multiple arc merged together with color parameters and position and start/end and adjustments
void Arc (color color1, color color2, color color3, color color4, color color5, color color6, color color7, float start, float end, float adjust, float positionx, float positiony, float adjust2) {
//space between different arc colors
  float space = 31;
  //loop that creates multiple arcs based on space size
  for (int i = 0; i<7 * space; i+= space) {
    //conditional statements that change the color to the ones in the parameter and parameters to controll the position and arc start/end and adjust the start/end of the longest size
    if (i==0) {
      fill(color1);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start-adjust2, TAU * end-adjust, PIE);
    }
    if (i== space) {
      fill(color2);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i== 2 *space) {
      fill(color3);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i== 3* space) {
      fill(color4);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i== 4* space) {
      fill(color5);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i== 5* space) {
      fill(color6);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i==6* space) {
      fill(color7);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
  }
}
