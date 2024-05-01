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
  //set background to black
  background(0);
  //red black background with text
  textSize(30);
  text("TRAIN INS.", 200, 100);
  textSize(40);
  //c train
  fill(#0039A6);
  circle(200, 400, 50);
  fill(255);
  text("C", 189, 413);

  fill(#0039A6);
  circle(200, 300, 50);
  fill(255);
  text("C#", 180, 313);
  
translate(-47,0);
  fill(#FF6319);
  circle(300, 400, 50);
  fill(255);
  text("D", 300-11, 413);

translate(-47,0);
  fill(#0039A6);
  circle(400, 400, 50);
  fill(255);
  text("E", 400-11, 413);
  
translate(-43,0);
  fill(#FF6319);
  circle(500, 400, 50);
  fill(255);
  text("F", 500-11, 413);

translate(-48,0);

  fill(#6CBE45);
  circle(600, 400, 50);
  fill(255);
  text("G", 600-11, 413);

translate(-49,0);

  fill(#0039A6);
  circle(700, 400, 50);
   fill(255);
  text("A", 700-11, 413);

translate(-49,0);

  fill(#FF6319);
  circle(800, 400, 50);
   fill(255);
  text("B", 800-11, 413);
}
//code runs when key is pressed
void keyPressed() {
  //check which key is pressed and play the note name
  switch(key) {
  case 'z':
    c.play(1, 1);

    break;
  case 's':
    csharp.play(1, 1);
    
    break;
  case 'l':
    csharp.play(2, 1);

    break;
  case 'x':
    d.play(1, 1);

 break;
  case '.':
    d.play(2, 1);

    break;
  case 'd':
    dsharp.play(1, 1);

    break;
  case 'c':
    e.play(1, 1);

    break;
  case 'v':
    f.play(1, 1);

    break;
  case 'g':
    fsharp.play(1, 1);

    break;
  case 'b':
    g.play(1, 1);

    break;
  case 'h':
    gsharp.play(1, 1);

    break;
  case 'n':
    a.play(2, 1);

    break;
  case 'j':
    asharp.play(2, 1);

    break;
  case 'm':
    b.play(2, 1);

    break;
  case ',':
    c.play(2, 1);

    break;

  case 'q':
    c.play(2, 1);

    break;
  case '2':
    csharp.play(2, 1);

    break;
  case 'w':
    d.play(2, 1);

    break;
  case '3':
    dsharp.play(2, 1);

    break;
  case 'e':
    e.play(2, 1);

    break;
  case 'r':
    f.play(2, 1);

    break;
  case '5':
    fsharp.play(2, 1);

    break;
  case 't':
    g.play(2, 1);

    break;
  case '6':
    gsharp.play(2, 1);

    break;
  case 'y':
    a.play(4, 1);

    break;
  case '7':
    asharp.play(4, 1);

    break;
  case 'u':
    b.play(4, 1);

    break;
  case 'i':
    c.play(4, 1);

    break;
  default:
    // triOsc.play(random(-900, 900), 0.5);
    a.play(0.5, 1);

    break;
  }
}
