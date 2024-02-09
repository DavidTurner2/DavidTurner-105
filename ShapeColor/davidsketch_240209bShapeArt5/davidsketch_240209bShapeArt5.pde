/* Inspired by Verena Loewensberg
Composition - 1970 https://www.wikiart.org/en/verena-loewensberg/composition-1970
*/

//code runs at the start
void setup(){
  //set size to 520,500 set stroke to no stroke
size(520,500);
noStroke();
}

//function draws every frae
void draw(){
  //background
  background(240);
  //create triangles that lean on each other switching from blue to red to blue
    fill(#016dc1);
    triangle(215,500,275,115,303,500);
    fill(#ee3121);
    triangle(302,500,285,252,404,505);
    fill(#016dc1);
    triangle(515,500,341,372,409,519);
    //save this rotation
    pushMatrix();
    //roatte upside down
    rotate(PI);
    //move flipped triangles
    float adjx = -494;
    float adjy = -499;
    //duplicated from bottom triangle except it changes from red to blue to red
    fill(#ee3121);
    triangle(200 + adjx,500 + adjy,260 + adjx,115 + adjy,288+adjx,500 + adjy);
    fill(#016dc1);
    triangle(287 +adjx,500+adjy,269+adjx,252+adjy,389+adjx,505+adjy);
    fill(#ee3121);
    triangle(500+adjx,500+adjy,326+adjx,372+adjy,395+adjx,519+adjy);
    //revert matrix so rotation for bottom triangle doesnt get messed up
    popMatrix();
}
//runs when mouse pressed
void mousePressed(){
  //save as png
  save(this + ".png");
}
