// inspired by concrete-poem-allison-parish.jpg https://sfpc.study/sessions/summer-24/human-scale-nlp
//Poem p = new Poem("Two roads diverged in a yellow wood And sorry I; could not travel both And be one traveler, long I stood And looked down one as far as i could to where it bent in the undergrowth Then took the other, as just as fair, And having perhaps the better claim, Because it was grassy and wanted wear; Though as for that the passing there Had worn them really about the same, And both that morning equally lay in leaves no step had trodden black. oh I kept the first for another day! Yet knowing how way leads on to way, I doubted if I should ever come back. I shall be telling this with a sigh Somewhere ages and ages hence: Two roads diverged in a wood, and I- I took the one less travelled by, And that has made all the difference.");
Poem p = new Poem("a a a a a a a a a Two roads diverged in a yellow wood And sorry I; could not travel both And be one traveler, long I stood And looked down one as far as I could to where it bent in the undergrowth Then took the other, as just as fair, And having perhaps the better claim, Because it was grassy and wanted wear; Though as for that the passing there Had worn them really about the same, And both that morning equally lay in leaves no step had trodden black. oh I kept the first for another day! Yet knowing how way leads on to way, I doubted if I should ever come back. I shall be telling this with a sigh Somewhere ages and ages hence: Two roads diverged in a wood, and I- I took the one less travelled by, And that has made all the difference.");

//code runs at start
void setup() {
  //set da suiz
  size(800, 800);
  textSize(29);
}
//selector circle
PVector circle = new PVector(0, 0);
//radisus
float r = 36;

//code runs every frame
void draw() {
  //map the selection cuz of the scale
  circle.set(map(mouseX, 0, 800, -980, 1000), map(mouseY, 0, 800, -980, 1000));
  //set background to white
  background(#ffffff);
  //translate + scale down
  translate(394, 397);
  scale(0.41);
  //display class black text
  fill(0);
  p.display();
  //display cursor
  circle(circle.x, circle.y, 10);
}
//if mouse dragged activate dragging method on poem objecy
void mouseDragged() {
  p.drag();
}
//if mouyse releasewd set dragging boolean variable in poem object to false
void mouseReleased() {
  p.dragging = false;
}
