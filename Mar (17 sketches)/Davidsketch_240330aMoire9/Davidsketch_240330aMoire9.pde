//global font varibale
PFont font;
//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000);
  //set font to loaded font from data
  font = loadFont("Wingdings2-48.vlw");
  //set text font to font at size 15
  textFont(font, 15);
  //set stroke to white
  stroke(255);
}
//code runs every frame
void draw() {
  //set background to black
  background(0);
  //0verlapping tangent waves
  for ( float i = 0; i<800; i+=0.05) {
    point(100+i, 100+40*tan(i/5));
    pushMatrix();
    //rotate offset
    rotate(0.2);
    point(105+i, 100+40*tan(i/5));
    popMatrix();
  }
  //stars
  for (int i = 0; i<40; i++) {
    //changing colors
    if (i%2==0) {
      fill(150, 100, 200);
    } else if(i%3==0) {
       fill(150, 100+100*norm(sin(frameCount/80.009), -1, 1), 240);
    }
    //bend slightly
    rotate(0.0015);
    //moiving stars
    text("êêêêêêêêêê", 400+400*sin(frameCount/99.009), 40+i*20);
    pushMatrix();
        //rotate offset

    rotate(0.7);
    text("êêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêê", 400, -400+i*20);
    popMatrix();
    pushMatrix();
    rotate(0.6);
    //rotate offset

    text("êêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêê", 400, -400+i*20);

    popMatrix();
  }
}
