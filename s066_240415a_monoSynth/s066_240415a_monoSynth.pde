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
float a, asharp, b, c, csharp, d, dsharp, e, f, fsharp, g, gsharp;
//code runs at setup
void setup() {
  //set note variables to frequencies
  c = 261.626;
  csharp = 277.183;
  d = 293.665;
  dsharp = 311.127;
  e = 329.628;
  f = 349.228;
  fsharp = 369.994;
  g = 391.995;
  gsharp = 415.305;
  a = 440;
  asharp = 466.164;
  b = 493.883;
  //set size to 800,800
  size(800, 800);
}
//code runs every frame
void draw() {
  //set background to black
  background(0);
  //red black background with text
  textSize(30);
  text("MONOPHONIC SYNTH", 200, 400);
  stroke(255, 0, 0);
  line(0, 600, 800, 10);
  line(0, 10, 800, 600);
}
//code runs when key is pressed
void keyPressed() {
  //check which key is pressed and play the note name
  switch(key) {
  case 'z':
    triOsc.play(c, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 's':
    triOsc.play(csharp, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'x':
    triOsc.play(d, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'd':
    triOsc.play(dsharp, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'c':
    triOsc.play(e, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'v':
    triOsc.play(f, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'g':
    triOsc.play(fsharp, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'b':
    triOsc.play(g, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'h':
    triOsc.play(gsharp, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'n':
    triOsc.play(a, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'j':
    triOsc.play(asharp, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'm':
    triOsc.play(b, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case ',':
    triOsc.play(c*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;

  case 'q':
    triOsc.play(c*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case '2':
    triOsc.play(csharp*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'w':
    triOsc.play(d*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case '3':
    triOsc.play(dsharp*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'e':
    triOsc.play(e*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'r':
    triOsc.play(f*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case '5':
    triOsc.play(fsharp*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 't':
    triOsc.play(g*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case '6':
    triOsc.play(gsharp*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'y':
    triOsc.play(a*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case '7':
    triOsc.play(asharp*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'u':
    triOsc.play(b*2, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  case 'i':
    triOsc.play(c*3, 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  default:
    triOsc.play(random(-900, 900), 0.5);
    env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
    break;
  }
}
