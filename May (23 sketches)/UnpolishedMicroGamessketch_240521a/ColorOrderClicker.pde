class ColorOrder {
  PVector[] ls = new PVector[20];
  //array of float values that control the opacity and when they spawn in
  float[] spawn = new float[20];
  //arrays for how long it takes for spawner to appear fully
  float[] spawnTime = new float[20];
  color[] c = new color[20];
  //timers for controlling when to start and stop
  float[] counter = new float[20];
  color[] randomize= new color[10];
  color[] colorsToClick = new color[10];
  String[] displayOrder = {"10", "9", "8", "7", "6", "5", "4", "3", "2", "1"};
  int missed = 0;
  float gtime = 0;
  int colorsClicked = 0;
  ColorOrder() {
    restart();
  }

  void update() {
   
    if (colorsClicked>=10) {
      minigame = 100;
      time = gtime;
      bad = missed;
      game="m1";
      restart();
    }
    if(frameCount%60==0){
    gtime++;
    }
    //increment all spawn values by the random spawn times for each
    for (int i = 0; i<20; i++) {
      spawn[i]+=spawnTime[i];
    }
    for (int i = 0; i<10-colorsClicked; i++) {
      textSize(40);
      fill(colorsToClick[9-i]);
      text(displayOrder[i], 400+i*-30, 100);
    }

    for (int i = 0; i<20; i++) {

      //even goes on left odd goes on right side
      if (spawn[i]>255) {
        if (frameCount%122==0) {
          //ls[i].set(random(width), random(height));
        }
        counter[i]+=0.7234;
        //play if not out of bounds
        if (counter[i]>200) {
          despawn("no", i);
        }
        noStroke();
        fill(c[i]);
        //when you select around the center of a spawner it despawns the spawner
        if (sel.dist(ls[i])<15) {
          if (mousePressed) {
            despawn("", i);
          }
          fill(255);
        }
        circle(ls[i].x, ls[i].y, 30);
        noFill();
        stroke(c[i]);
      } else {
        noStroke();
        fill(c[i], spawn[i]);
        if (sel.dist(ls[i])<15) {
          if (mousePressed) {
            despawn("no", i);
          }
          fill(255);
        }
        circle(ls[i].x, ls[i].y, 30);
      }
    }
  }
  void despawn(String s, int i) {
    if (s=="no") {
      spawn[i] = 0;
      counter[i] = 0;
      //even goes on left odd goes on right side
      ls[i].set(random(width), random(height));
      c[i]=colorsToClick[int(random(colorsToClick.length))];
    } else {
      if (c[i] == colorsToClick[colorsClicked]) {
        if(colorsClicked<10){
        colorsClicked++;
        spawn[i] = 0;
        counter[i] = 0;
        //even goes on left odd goes on right side
        ls[i].set(random(width), random(height));
        c[i]=colorsToClick[int(random(colorsToClick.length-1))];
        }
      } else {
        spawn[i] = 0;
        counter[i] = 0;
        missed++;
      }
    }
  }

  void restart() {
    missed = 0;
    gtime = 0;
    colorsClicked = 0;
    for (int i = 0; i<colorsToClick.length; i++) {
      randomize[i] = color(random(100, 255), random(100, 255), random(100, 255));
      colorsToClick[i]=randomize[i];
    }
    for (int i = 0; i<20; i++) {
      spawnTime[i] = random(3.87, 5.5);
      spawn[i] = 0;
      counter[i] = 0;
      ls[i] = new PVector(random(width), random(height));
      c[i]=colorsToClick[int(random(colorsToClick.length-1))];
    }
  }
}
