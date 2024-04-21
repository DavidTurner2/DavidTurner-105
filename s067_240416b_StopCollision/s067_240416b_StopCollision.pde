//create new spwaner object
Spawners r = new Spawners();
//create pvector for selctor
PVector sel = new PVector(0, 0);

//code runs at setup
void setup() {
  //set size to 800,800
  size(800, 800);
  //set rectangle mode to center
  rectMode(CENTER);
}
//code runs every frame
void draw() {
  //set selector to mousex and mousey poistions
  sel.set(mouseX, mouseY);
  //set background to black
  background(0);
  //run game
  r.update();
}
//you cant let the block collide or the circles collide
