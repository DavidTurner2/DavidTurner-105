//inspired by truisms by jenny holzer
//code runs at start
void setup() {
  //declare pfont variable font
  PFont font;
  //set size to 1000,1000
  size(1000, 1000);
  //asign font i created to font variable
  font = loadFont("Algerian-48.vlw");
  //set text font to font variable and size to 64
  textFont(font, 64);
}
//code runs every frame unless noLoop function runs
void draw() {
  //set background to black
  background(0);
  //write the quote from truism
//random scatter and make transparent over time the quote
  for (int i = 0; i<50; i++) {
    fill(#00ff00, 180-i*2);
    text("MONEY CREATES TASTE", 100 + i*random(-0.5,0.5), 200 - i*random(-0.5,0.5));
  }  
  //set fill to darkish green
  fill(#5f975f);
  //make bold effect
  for (int i = 0; i<9; i++){
  text("MONEY CREATES TASTE", 100+i, 200);
  }


  //set stroke to green and stroke weight to 10
  stroke(#1ae31a, 70);
  strokeWeight(10);
  //do some random positioning with rectangles and dollar signs for stange effect
  for (int i = 0; i< 100; i++) {
    // set random values to apply to both rectangles and dollar sign
    float r = random(-500, 800);
    float r2 = random(0, 800);
    //loop to make random bolding
    for (int j = 0; j<9; j+=int(random(1, 3))) {
      //no fill rectangle
      noFill();
      rect(200 + 200+r + j, 220 + 100+r2, 125, 75);
      //dollar sign green fill
      fill(#2eb52e, 190);
      text("$20", 200 + 200+ r + j, 280 + 100+r2);
    }
  }
  //end this draw function
  noLoop();
}
//code runs when mouse pressed
void mousePressed() {
  //save file as png
  save(this + ".png");
}
