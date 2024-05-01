//make global pimage variables
PImage piano;
PImage harp;
PImage table;
PImage chair;
PImage lamp;
void setup() {
  //set size to 800,800 render in p3d
  size(800, 800, P3D);
  //load in images from data folder
  piano = loadImage("piano.jpg");
  harp = loadImage("harp.jpg");
  table = loadImage("table.jpg");
  chair = loadImage("chair.jpg");
  lamp = loadImage("lamp.png");
}
//code runs every frame
void draw() {
  //background to gray
  background(155);
  //lights
  lights();

  //put piano move it then rotate it a little
  pushMatrix();
  translate(477, -219, -646);
  rotateX(-0.03);
  rotateY(-1.25);
  rotateZ(0.01);
  image(piano, 400, 400, 424, 537);
  popMatrix();

  //put harp move it then rotate it a little
  pushMatrix();
  translate(-187, -229, 0);
  rotateY(0.73);
  image(harp, 164, 400, 300, 585);
  popMatrix();

  //put table move it
  pushMatrix();
  translate(-236, 294, -445);
  rotateX(0.70);
  image(table, 400, 388, 409, 152);
  popMatrix();

  //put chair move it
  pushMatrix();
  translate(10, -58, -369);
  image(chair, 400, 400, 240, 330);
  popMatrix();

  //put lamp move it
  pushMatrix();
  translate(0, -10, -148);
  image(lamp, 282, 486, 126, 175);
  popMatrix();
}
//code runs when mouse is pressed
void mousePressed(){
  //save file as a png
 save(this+".png"); 
}
