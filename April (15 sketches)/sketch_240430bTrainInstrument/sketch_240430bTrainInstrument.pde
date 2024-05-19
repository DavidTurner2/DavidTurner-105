//import sound library
import processing.sound.*;
//create objects from library
TriOsc triOsc = new TriOsc(this);
// Create the envelope
Env env = new Env(this);

//set envelopes for envolope generator
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.4;
//create variable for notes
SoundFile a, asharp, b, c, csharp, d, dsharp, e, f, fsharp, g, gsharp;
float lerpc = 0;
float lerpcsharp = 0;
float lerpd = 0;
float lerpdsharp = 0;
float lerpe = 0;
float lerpf = 0;
float lerpfsharp = 0;
float lerpg = 0;
float lerpgsharp = 0;
float lerpa = 0;
float lerpasharp = 0;
float lerpb = 0;

//code runs at setup
void setup() {
  //set note variables to frequencies
  c  = new SoundFile(this, "train_C.wav");
  csharp = new SoundFile(this, "train_Csharp.wav");
  d = new SoundFile(this, "train_D.wav");
  dsharp = new SoundFile(this, "train_Dsharp.wav");
  e = new SoundFile(this, "train_E.wav");
  f = new SoundFile(this, "train_F.wav");
  fsharp = new SoundFile(this, "train_Fsharp.wav");
  g = new SoundFile(this, "train_G.wav");
  gsharp = new SoundFile(this, "train_Gsharp.wav");
  a = new SoundFile(this, "train_A.wav");
  asharp = new SoundFile(this, "train_Asharp.wav");
  b = new SoundFile(this, "train_B.wav");
  //set size to 800,800
  size(800, 800);
}
//code runs every frame
void draw() {
  //increase lerp to the notes original color
  lerpc +=0.1;
  lerpcsharp +=0.1;
  lerpd +=0.1;
  lerpdsharp +=0.1;
  lerpe +=0.1;
  lerpf +=0.1;
  lerpfsharp +=0.1;
  lerpg +=0.1;
  lerpgsharp +=0.1;
  lerpa +=0.1;
  lerpasharp +=0.1;
  lerpb +=0.1;
  //set background to black
  background(0);
  //red black background with text
  textSize(30);
  text("TRAIN INSTRUMENT", 200, 100);
  textSize(40);

  //circles trains lerp everycolor by notes
  fill(lerpColor(#ffffff, #0039A6, lerpc));
  circle(200, 400, 50);
  fill(255);
  text("C", 189, 413);

  fill(lerpColor(#ffffff, #0039A6, lerpcsharp));
  circle(209, 300, 50);
  fill(255);
  text("C#", 187, 313);

  translate(-47, 0);
  fill(lerpColor(#ffffff, #FF6319, lerpd));
  circle(300, 400, 50);
  fill(255);
  text("D", 300-11, 413);

  fill(lerpColor(#ffffff, #FF6319, lerpdsharp));
  circle(310, 300, 50);
  fill(255);
  text("D#", 300-11, 313);

  translate(-47, 0);
  fill(lerpColor(#ffffff, #0039A6, lerpe));
  circle(400, 400, 50);
  fill(255);
  text("E", 400-11, 413);

  translate(-43, 0);
  fill(lerpColor(#ffffff, #FF6319, lerpf));
  circle(500, 400, 50);
  fill(255);
  text("F", 500-11, 413);

  fill(lerpColor(#ffffff, #FF6319, lerpfsharp));
  circle(510, 300, 50);
  fill(255);
  text("F#", 500-11, 313);

  translate(-48, 0);
  fill(lerpColor(#ffffff, #6CBE45, lerpg));
  circle(600, 400, 50);
  fill(255);
  text("G", 600-11, 413);

  fill(lerpColor(#ffffff, #6CBE45, lerpgsharp));
  circle(609, 300, 50);
  fill(255);
  text("G#", 598-11, 313);

  translate(-49, 0);
  fill(lerpColor(#ffffff, #0039A6, lerpa));
  circle(700, 400, 50);
  fill(255);
  text("A", 700-11, 413);

  fill(lerpColor(#ffffff, #0039A6, lerpasharp));
  circle(710, 300, 50);
  fill(255);
  text("A#", 700-11, 313);

  translate(-49, 0);
  fill(lerpColor(#ffffff, #FF6319, lerpb));
  circle(800, 400, 50);
  fill(255);
  text("B", 800-11, 413);
}
//code runs when key is pressed
void keyPressed() {
  //check which key is pressed and play the note name and make the lerp of the note = to 0 to make the circle go white
  //i just wanted to use this since i havent used it in a while
  switch(key) {
  case 'z':
    c.play(1, 1);
    lerpc=0;
    break;
  case 's':
    csharp.play(1, 1);
    lerpcsharp=0;
    break;
  case 'l':
    csharp.play(2, 1);
    break;
  case 'x':
    d.play(1, 1);
    lerpd=0;
    break;
  case '.':
    d.play(2, 1);
    lerpd=0;
    break;
  case 'd':
    dsharp.play(1, 1);
    lerpdsharp=0;
    break;
  case 'c':
    e.play(1, 1);
    lerpe=0;
    break;
  case 'v':
    f.play(1, 1);
    lerpf=0;
    break;
  case 'g':
    fsharp.play(1, 1);
    lerpfsharp=0;
    break;
  case 'b':
    g.play(1, 1);
    lerpg=0;
    break;
  case 'h':
    gsharp.play(1, 1);
    lerpgsharp=0;
    break;
  case 'n':
    a.play(2, 1);
    lerpa=0;
    break;
  case 'j':
    asharp.play(2, 1);
    lerpasharp=0;
    break;
  case 'm':
    b.play(2, 1);
    lerpb=0;
    break;
  case ',':
    c.play(2, 1);
    lerpc=0;
    break;
  case 'q':
    c.play(2, 1);
    lerpc=0;
    break;
  case '2':
    csharp.play(2, 1);
    lerpcsharp=0;
    break;
  case 'w':
    d.play(2, 1);
    lerpd=0;
    break;
  case '3':
    dsharp.play(2, 1);
    lerpdsharp=0;
    break;
  case 'e':
    e.play(2, 1);
    lerpe=0;
    break;
  case 'r':
    f.play(2, 1);
    lerpf=0;
    break;
  case '5':
    fsharp.play(2, 1);
    lerpfsharp=0;
    break;
  case 't':
    g.play(2, 1);
    lerpg=0;
    break;
  case '6':
    gsharp.play(2, 1);
    lerpgsharp=0;
    break;
  case 'y':
    a.play(4, 1);
    lerpa=0;
    break;
  case '7':
    asharp.play(4, 1);
    lerpasharp=0;
    break;
  case 'u':
    b.play(4, 1);
    lerpb=0;
    break;
  case 'i':
    c.play(4, 1);
    lerpc=0;
    break;
  case 'Z':
    c.play(1, 1);
    lerpc=0;
    break;
  case 'S':
    csharp.play(1, 1);
    lerpcsharp=0;
    break;
  case 'L':
    csharp.play(2, 1);
    break;
  case 'X':
    d.play(1, 1);
    lerpd=0;
    break;
  case 'D':
    dsharp.play(1, 1);
    lerpdsharp=0;
    break;
  case 'C':
    e.play(1, 1);
    lerpe=0;
    break;
  case 'V':
    f.play(1, 1);
    lerpf=0;
    break;
  case 'G':
    fsharp.play(1, 1);
    lerpfsharp=0;
    break;
  case 'B':
    g.play(1, 1);
    lerpg=0;
    break;
  case 'H':
    gsharp.play(1, 1);
    lerpgsharp=0;
    break;
  case 'N':
    a.play(2, 1);
    lerpa=0;
    break;
  case 'J':
    asharp.play(2, 1);
    lerpasharp=0;
    break;
  case 'M':
    b.play(2, 1);
    lerpb=0;
    break;
  case 'Q':
    c.play(2, 1);
    lerpc=0;
    break;
  case 'W':
    d.play(2, 1);
    lerpd=0;
    break;
  case 'E':
    e.play(2, 1);
    lerpe=0;
    break;
  case 'R':
    f.play(2, 1);
    lerpf=0;
    break;
  case 'T':
    g.play(2, 1);
    lerpg=0;
    break;
  case 'Y':
    a.play(4, 1);
    lerpa=0;
    break;
  case 'U':
    b.play(4, 1);
    lerpb=0;
    break;
  case 'I':
    c.play(4, 1);
    lerpc=0;
    break;
  default:
  //if a key that isnt any of those play random notes using the a train sample
    a.play(random(0.5, 3), 1);
    break;
  }
}
