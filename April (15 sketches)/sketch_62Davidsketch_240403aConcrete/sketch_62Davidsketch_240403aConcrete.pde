//code runs at start
Poem asdf = new Poem("YOU WILL NEVER FIGURE OUT THIS PROGRAM, BECAUSE IM EATING CHICKEN AND HAM, A BOMB GOES BAM, AND IM GOING TO SLAM, THEN I FARTED AND IT SMELLED LIKE ROTTEN EGGS, WHEN I CODE I LEAVE NO COMMENTS, WHO ARE YOU MY FUTURE SELF? WHO ARE YOU SOMEBODYELSEJALISTICATION ", 400, 400);

void setup() {
  //set size
  size(700, 700);
}
PVector circle = new PVector(0, 0);
float r = 36;
//code runs every frame
void draw() {
  circle.set(mouseX, mouseY);
  background(0);
  fill(255);
  asdf.display();
  fill(0,0);
  circle(mouseX, mouseY, r);
}



void mouseDragged() {
  asdf.drag();
}

void mouseReleased(){
  asdf.dragging = false;
}
