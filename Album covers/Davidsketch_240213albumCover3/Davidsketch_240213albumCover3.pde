//https://holdingpatterns.bandcamp.com/album/endless
//add commments
//code runs at start
void setup() {
  PFont font;
  font = loadFont("Arial-BoldMT-48.vlw");
  textFont(font,32);
  size(1000, 1000);
}
void draw() {
  background(#b9bab2);
  fill(0);
  text("holding \npatterns",840,75);
  fill(255);
  text("endless",840,150);
  pushMatrix();
  rotate(PI * 0.16);
  float adjustx = 220;
  float adjusty = -276;
  fill(#be302e);
  square(157 + adjustx,150+ adjusty,648);
  stroke(0);
  strokeWeight(8);
  for(int j = 0; j<4;j++){
  for(float i = 0 ; i<735; i+=0.40){
  point(529+ adjustx + i,j*42+ adjusty + 327+14*sin(i * PI/29.5));
  }
}
popMatrix();  
  
  
  fill(0, 220);
  noStroke();
  circle(100, 100, 335);
  for (int i = 0; i<3 * 130; i+= 132) {
    rect(0 + i, 822, 89, 370);
  }
  for (int i = 0; i<4 * 64; i+=64) {
    if (i ==64*2) {
      rect(555 + i, 190, 42, -326);
    } else if (i==64) {
      rect(555 + i, 190 + i/1.01, 42, -326);
    } else {
      rect(555 + i, 190 + i/1.12, 42, -366);
    }
  }
  triangle(720,1000,842,781,967,1000);  
}
void mousePressed(){
  save(this + ".png");
}
