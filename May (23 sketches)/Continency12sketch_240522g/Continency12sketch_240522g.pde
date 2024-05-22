//Komposition Blau-Rot auf Weiss
//Blinky Palermo
//Date: 1965


void setup(){
  size(800,800);
  strokeCap(PROJECT);
}

void draw(){
  
  background(226,219,207);
  strokeWeight(12);
  stroke(160,35,36);
  line(400,0,400,800);
  stroke(38,54,150);
  line(0,650,800,650);
  fill(10,10,50);
  rect(-100,650,950,650);
}
