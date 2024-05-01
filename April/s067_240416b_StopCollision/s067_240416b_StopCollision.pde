//create new spwaner object
Spawners r = new Spawners();
//create pvector for selctor
PVector sel = new PVector(0, 0);
//create start boolean to check if game is started
boolean start = false;
//variable for score
int score = 0;
//timer variabel
int countdown = 0;
//variable for controlling death screen transparency
float appear = 0;
//code runs at setup
void setup() {
  //set size to 800,800
  size(800, 800);

}
//code runs every frame
void draw() {
  //set selector to mousex and mousey poistions
  sel.set(mouseX, mouseY);
  //set background to black
  background(0);
  if (start) {
    strokeWeight(1);
      //set rectangle mode to center
  rectMode(CENTER);
  r.update();
  } else {
    //start screen
      //set rectangle mode to corner
  rectMode(CORNER);
    strokeWeight(1);
    
    fill(255);
    stroke(0);
    square(0, 0, 900);
    triangle(400, 200, 500, 400, 300, 400);
    ellipse(399, 309, 62, 36);
    fill(0);
    //moving title screen
    circle(399+9*norm(sin(frameCount*0.021), -1, 1), 310+6*norm(sin(frameCount*0.021), -1, 1), 20);
    //click on button to set boolean start true
    if (mouseX>462 && mouseX<462+118&&mouseY>424&&mouseY<424+31) {
      if (mousePressed) {
        start = true;
        score = 0;
      }
      fill(10, 0, 150);
    } else {
      fill(0);
    }
    //start button
    rect(462, 424, 118, 31);
    fill(255);
    text("START", 466, 451);

    //death screen
    fill(255, appear);
    square(0, 0, 900);
    fill(0, appear);
    //show score
    text(score, 400, 400);
    //countdown to change appear transparancy
    if (countdown<0) {
      appear-=2.4;
    }
    countdown--;
  }
  //run game
}
//you cant let the block collide or the circles collide
