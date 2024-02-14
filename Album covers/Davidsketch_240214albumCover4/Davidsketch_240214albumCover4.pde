//inspired by album cover level by disasterpeace https://disasterpeace.bandcamp.com/album/level

//code runs at start
void setup() {
  //set size to 600 600
  size(600, 600);
  //put no stroke
  noStroke();
}
//code runs every frame
void draw() {
  //set background to white
  background(255);
  //make blue rectangle
  fill(#37b0db);
  rect(0, 0, 600, 200);
  //make grey rectangle
  fill(221);
  rect(0, 200, 600, 200);

//make row of squares and make certain squares in the row blue
  for (int i = 0; i<12; i++) {
    fill(221);
    if (i==2) {
      fill(#37b0db);
    }
    if (i==4) {
      fill(#37b0db);
    }
    if (i==6) {
      fill(#37b0db);
    }
    if (i==8) {
      fill(#37b0db);
    }
    if (i==10) {
      fill(#37b0db);
    }
    square(450 + i*9, 511, 5);
  }
  //make another row of squares shifted down vertically and make certain squares in the row blue

  for (int i = 0; i<12; i++) {
    fill(221);
    if (i==2) {
      fill(#37b0db);
    }
    if (i==5) {
      fill(#37b0db);
    }
    if (i==6) {
      fill(#37b0db);
    }
    if (i==9) {
      fill(#37b0db);
    }
    if (i==10) {
      fill(#37b0db);
    }
    square(450 + i*9, 520, 5);
  }
    //make another row of squares shifted down vertically and make certain squares in the row blue

  for (int i = 0; i<12; i++) {
    fill(221);
    if (i==2) {
      fill(#37b0db);
    }
    if (i==1) {
      fill(#37b0db);
    }
    if (i==6) {
      fill(#37b0db);
    }
    if (i==7) {
      fill(#37b0db);
    }
    if (i==10) {
      fill(#37b0db);
    }
    square(450 + i*9, 529, 5);
  }
}

//code runs when mouse is pressed
void mousePressed(){
 save(this+".png"); 
}
