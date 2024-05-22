// inspired by Slowdive – Pygmalion open.spotify.com/album/7n7VUw9XFam4zMT7zn99tq
void setup() {
  size(800, 800);
}

void draw() {
  background(#beb6a6);
  noStroke();
  fill(#3f5c6e);
  for (int i = 0; i<3; i++) {
    square(100, 180+i*26.06, 18);
  }
  fill(#426254);
  for (int i = 0; i<3; i++) {
    square(123, 232+i*26.06, 18);
    square(146, 232+i*26.06, 18);
  }
  fill(#3f5c6e);
  for (int i = 0; i<3; i++) {
    square(170, 266+i*26.06, 18);
  }
  fill(#3f5c6e);

  for (int i = 0; i<3; i++) {
    square(194, 232+i*26.06, 18);
    square(220, 232+i*26.06, 18);
  }
  fill(#3f5c6e);

  for (int i = 0; i<3; i++) {
    square(280, 266+i*26.06, 18);
  }
  fill(50);
  for (int i = 0; i<4; i++) {
    square(330, 206+i*45.80, 40);
  }
  fill(52);

  for (int i = 0; i<4; i++) {
    square(378, 215+i*45.80, 23);
  }
  fill(54);

  for (int i = 0; i<4; i++) {
    square(405, 221+i*43.56, 16);
  }
  fill(80, 44);

  circle(514, 272, 177);
  fill(37);

  for (int i = 0; i<3; i++) {
    square(466, 202+i*46.73, 40);
  }
  fill(41);

  for (int i = 0; i<3; i++) {
    rect(512, 202+i*46.73, 20, 40);
  }

  square(127, 400, 40);
  square(127, 459, 40);
  rect(164, 411, 40, 15);
  rect(164, 471, 40, 15);
  rect(236, 439, 76, 15);
  rect(200, 411, 37, 75);
  
  rect(551, 422, 40, 169);

  for (int i = 0; i<3; i++) {    
    rect(453, 580+6-i*32.7, 138, 12);
  }
      rect(470, 486, 94, 12);
      rect(489, 453, 78, 12);
      rect(503, 422, 50, 12);

  textSize(27);
  text("slowdive",132,611);
}
