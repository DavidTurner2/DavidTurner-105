//uses code from Matthew Balousek github.com/mrfb

//import sound library
import processing.sound.*;
//create soundfile variables
SoundFile[] stems = new SoundFile[16];
SoundFile button;
int[][] random = new int[16][16];
// the File class is our file input/output manager from the java class
// https://docs.oracle.com/javase/8/docs/api/java/io/File.html
File f;
PVector sel = new PVector(0, 0);
int check = 0;
float move =0;
int bar = 0;
boolean playing = true;
NumberArea speed = new NumberArea(1);
NumberArea barRepeat = new NumberArea(1);

void setup() {
  size(800, 800);
  // this is the important part:
  // dataPath("") gets us the platform-specific absolute
  // location of where the data folder is
  f = new File(dataPath(""));
  //button = new SoundFile(this,"button.wav");
  for (int i = 0; i < f.list().length; i++) {
    if (i<16) {
      stems[i] = new SoundFile(this, f.list()[i]);
    }
  }
  for (int j = 0; j<16; j++) {
    for (int i = 0; i<f.list().length; i++) {
      int a = int(random(2));
      random [i][j] =a;
      if (a==0) {
        check++;
      }
      if (check==f.list().length-2) {
        random[int(random(f.list().length))][j]=1;
        check = 0;
      }
    }
  }
}

void draw() {
  //set selecector value
  sel.set(mouseX, mouseY);
  //moving playlist
  if (mouseX<150 && (mouseY>520-80)) {
    //dont move if it goes out of bounds
    if (move<0) {
      move+=7.232;
    }
  } else if (mouseX>650 && (mouseY>520-80)) {
    //dont move if it goes out of bounds
    if (move>-1400) {
      move-=7.232;
    }
  }

  background(0);
  fill(200);
  rect(0, 7, 440, 394);
  //labels
  textSize(20);
  fill(255);
  //hint text
  text("press R to Randomize\nArrow keys or A and D to change bars", 470, 400);
  text("Speed", 500, 90);
  text("Repeat Bars", 500, 190);
  //buttons for controlling the speed and how many times to repeat bars
  speed.position(500, 100);
  barRepeat.position(500, 200);

  fill(1);
  textSize(16);
  stroke(0);
  //displaying files names
  text("|File Name|------------------------------|Lengths Need To Be The Same|", 5, 51-25);
  //row lines
  for (int i = 0; i<17; i++) {
    line(0, 29+i*23, 470, 29+i*23);
  }
  //file names and durations
  for (int i = 0; i<f.list().length; i++) {
    text(f.list()[i], 7, 51+i*23);
    text(stems[i].duration(), 350, 51+i*23);
  }
  //playlist
  pushMatrix();
  //changing colros
  fill(map(sin(frameCount/42.009), -1, 1, 170, 220),
    map(sin(frameCount/79.009), -1, 1, 170, 240),
    map(sin(frameCount/39.009), -1, 1, 190, 255));
  rect(0, 510-80, 1200, 450);
  //translate with move value
  translate(move, -80);

  //set rectangles of stems based on if on [1] or off [0] from random array of arrays
  for (int j = 0; j<16; j++) {
    for (int i = 0; i<f.list().length; i++) {
      if (random[i][j]==1) {
        fill(255);
        rect(7+j*120, 519+i*21, 118, 21);
        fill(100);
        textSize(10);
        text(f.list()[i], 7+j*120, 529+i*21);
      }
      line(7, 519+i*21, 79000, 519+i*21);
      line(7+j*120, 519, 7+j*120, 9988);
    }
  }
  //play the stems and move circle mapping the duration and the current bar
  //increase bar to go up the array dimension
  for (int i = 0; i<16; i++) {
    if (bar<16) {
    } else {
      bar=0;
      move=bar*-100;
    }
    if (random[i][bar/int(barRepeat.value)]==1) {
      play();

      if (!(stems[i].isPlaying())) {
        if (bar<16) {
          bar++;
          move=bar*-100;

          playing = true;
        }
      }
      circle(map(stems[i].position(), 0, stems[i].duration(), 7+bar/int(barRepeat.value)*120, 127+bar/int(barRepeat.value)*120), 500, 30);
    }
  }
  popMatrix();
}
//seperate function for playing because im doing something else when the audio.isPlaying is false 
void play() {
  if (playing) {
    for (int i = 0; i<stems.length; i++) {
      if (random[i][bar/int(barRepeat.value)]==1) {
        stems[i].play(speed.value);
      }
    }
  }
  playing = false;
}
//code runs when key is pressed
void keyPressed() {
  numberTyping(speed);
  numberIntTyping(barRepeat);
  //restart
  if (key=='r'||key=='R') {
    stopStems();
    bar=0;
    move=bar*-100;

    playing = true;

    for (int j = 0; j<16; j++) {
      for (int i = 0; i<f.list().length; i++) {
        int a = int(random(2));
        random [i][j] =a;
        if (a==0) {
          check++;
        }
        if (check==f.list().length-2) {
          random[int(random(f.list().length))][j]=1;
          check = 0;
        }
      }
    }
  }
  //direction keys
  if (key=='a'||key=='A') {
    goBack();
    move=bar*-100;
  }
  if (key=='d'||key=='D') {
    goForward();
    move=bar*-100;
  }

  if (key == CODED) {
    if (keyCode==LEFT) {
      goBack();
      move=bar*-100;
    }
    if (keyCode==RIGHT) {
      goForward();
      move=bar*-100;
    }
  }
}
//go back a bar but not over boundaries
void goBack() {
  stopStems();
  if (bar>0) {
    for (int i = 0; i<int(barRepeat.value); i++) {
      bar--;
    }
    playing = true;
  } else {
    bar++;
    bar=0;
    playing = true;
  }
}
//go forward a bar but not over boundaries

void goForward() {
  stopStems();
  if (bar<16) {
    for (int i = 0; i<int(barRepeat.value); i++) {
      bar++;
    }
    playing = true;
  } else {
    bar--;
    bar=15;
    playing = true;
  }
}
//stop the stems that are activated
void stopStems() {
  for (int i = 0; i<stems.length; i++) {
    if (random[i][bar/int(barRepeat.value)]==1) {
      stems[i].stop();
    }
  }
}
//function for typing in numbers in number area
void numberTyping(NumberArea area) {
  if (collision(area.pos, area.w, area.h)) {
    //reset initial values on keypress
    if (keyPressed) {
      if (area.init==true) {
        area.init = false;
        area.text="";
      }

      if (area.text.length()>9) {
        if (key==unhex("0008")) {
          if (area.increment>0) {
            area.increment--;
            area.text = area.saved[area.increment];
          }
        } else {
          area.text="";
          area.increment = 0;
        }
      } else {

        if (key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'
          ||key=='9'||key=='0'||key=='.') {
          area.text+=key;
          area.increment++;
          area.saved[area.increment]=area.text;
          stopStems();
          playing = true;
        }
        if (key==unhex("0008")) {
          if (area.increment>0) {
            area.increment--;
            area.text = area.saved[area.increment];
            stopStems();
            playing = true;
          }
        }
      }
    }
  }
}
//typing only integers
void numberIntTyping(NumberArea area) {
  if (collision(area.pos, area.w, area.h)) {
    //reset initial values on keypress
    if (keyPressed) {
      if (area.init==true) {
        area.init = false;
        area.text="";
      }

      if (area.text.length()>9) {
        if (key==unhex("0008")) {
          if (area.increment>0) {
            area.increment--;
            area.text = area.saved[area.increment];
          }
        } else {
          area.text="";
          area.increment = 0;
        }
      } else {

        if (key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'
          ||key=='9'||key=='0') {
          area.text+=key;
          area.increment++;
          area.saved[area.increment]=area.text;
          stopStems();
          playing = true;
        }
        if (key==unhex("0008")) {
          if (area.increment>0) {
            area.increment--;
            area.text = area.saved[area.increment];
            stopStems();
            playing = true;
          }
        }
      }
    }
  }
}

boolean collision(PVector a, float wide, float high) {
  if (sel.x>a.x&&sel.x<a.x+wide&&sel.y>a.y&&sel.y<a.y+high) {
    return true;
  } else {
    return false;
  }
}
