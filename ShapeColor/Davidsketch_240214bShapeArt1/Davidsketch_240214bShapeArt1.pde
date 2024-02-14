/* inspired by Galliano Mazzon 
Fantasia n. 83 - 1966 https://www.wikiart.org/en/galliano-mazzon/fantasia-n-83-1966
*/
//code runs at start
void setup(){
  //set size to 500,600
  size (500,600);
  //get no stroke
  noStroke();
}
//code runs every frame
void draw(){
  //set background to dark blue
  background(#17346c);
  //make lighter blue shdded quards
  fill(#205c93);
  quad(0,0,110,220,390,220,500,0);
  quad(0,600,150,430,350,430,500,600);
  //make blue quad
  fill(#144179);
  quad(88,180,160,330,340,330,410,181);
  //make rectangle connected to it
  rect(151,430,199,-200);
  //make two darkest blue triangles
  fill(#1c2b5d);
  triangle(351,309,250,180,150,309);
  triangle(351,431,253,308,148,431);
}
//code runs when mouse is pressed
void mousePressed(){
  save(this + ".png");
}
