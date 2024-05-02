class Spawners {
  //the pvector array for the spawners to go to
  PVector[] ls = new PVector[100];
  //the current enemyies spawned
  float enemies = 2;
  //array of float values that control the opacity and when they spawn in
  float[] spawn = new float[100];
  //arrays for how long it takes for spawner to appear fully
  float[] spawnTime = new float[100];
  //timers for controlling when to start and stop
  float[] counter = new float[100];
  //the level you are on
  boolean[] lvl = new boolean[12];
  //colors for each level of spawners
  color[] c = new color[100];

  color[] colors = new color[12];
  color prev;
  //when the circle goes out of bounds
  float out = 1738;

  Spawners() {
    //set lecel ad coles
    for (int i = 0; i<12; i++) {
      lvl[i]=true;
      colors[i] = color(random(100, 255), random(100, 255), random(100, 255));
    }

    //set colors for each level with for loops
    for (int i = 0; i<2; i++) {
      c[i] =colors[0];
    }
    for (int i = 2; i<5; i++) {
      c[i] =colors[1];
    }
    for (int i = 5; i<10; i++) {
      c[i] =colors[2];
    }
    for (int j = 0; j<9; j++) {
      for (int i = 10+j*10; i<20+j*10; i++) {
        c[i] = colors[3+j];
      }
    }

    //set random spawn times and set eveything to 0
    for (int i = 0; i<100; i++) {
      if (i<5) {
        spawnTime[i] = random(0.87, 1.5);
      }
      if (i>=5&&i<=40) {
        spawnTime[i] = random(0.1, 1.4);
      }
      if (i>40) {
        spawnTime[i] = random(0.1, 0.7);
      }

      spawn[i] = 0;
      counter[i] = 0;
      //even goes on left odd goes on right side of screen
      if (i%2==0) {
        ls[i] = new PVector(random(350), random(800));
      } else {
        ls[i] = new PVector(random(450, 800), random(800));
      }
    }
  }


  void update() {

    //progression
    if (lvl[0]) {
      //temporary counter variable
      int a = 0;
      // println(a);
      for (int i = 0; i<2; i++) {
        //check if all circles are out
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >1) {
          lvl[0] = false;
          enemies = 5;
        }
      }
    } else if (lvl[1]) {
      int a=0;
      for (int i = 0; i<5; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >4) {
          lvl[1] = false;
          enemies = 10;
        }
      }
    } else if (lvl[2]) {
      int a=0;
      for (int i = 0; i<10; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >9) {
          lvl[2] = false;
          enemies = 15;
        }
      }
    } else if (lvl[3]) {
      int a=0;
      for (int i = 0; i<15; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >14) {
          lvl[3] = false;
          enemies = 20;
        }
      }
    } else if (lvl[4]) {
      int a=0;
      for (int i = 0; i<20; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >19) {
          lvl[4] = false;
          enemies = 25;
        }
      }
    } else if (lvl[5]) {
      int a=0;
      for (int i = 0; i<25; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >24) {
          lvl[5] = false;
          enemies = 30;
        }
      }
    } else if (lvl[6]) {
      int a=0;
      for (int i = 0; i<30; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >29) {
          lvl[6] = false;
          enemies = 35;
        }
      }
    } else if (lvl[7]) {
      int a=0;
      for (int i = 0; i<35; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        if (a >34) {
          lvl[7] = false;
          enemies = 40;
        }
      }
    } else if (lvl[8]) {
      int a=0;
      for (int i = 0; i<40; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >39) {
          lvl[8] = false;
          enemies = 50;
        }
      }
    } else if (lvl[9]) {
      int a=0;
      for (int i = 0; i<50; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >49) {
          lvl[9] = false;
          enemies = 100;
        }
      }
    } else if (lvl[10]) {
      int a=0;
      for (int i = 0; i<100; i++) {
        if (counter[i]>out) {
          a++;
        } else {
          a = 0;
        }
        //check loop twice
        if (a >99) {
          lvl[10] = false;
          enemies = 0;
        }
      }
    }





    //increment all spawn values by the random spawn times for each
    for (int i = 0; i<enemies; i++) {
      spawn[i]+=spawnTime[i];
    }
    //only loop to current enemies
    for (int i = 0; i<enemies; i++) {

      //even goes on left odd goes on right side
      if (i%2==0) {
        if (spawn[i]>255) {
          counter[i]+=0.7234;
          noStroke();
          fill(c[i]);
          //when you select around the center of a spawner it despawns the spawner
          if (sel.dist(ls[i])<20) {
            if (mousePressed) {
              despawn(i);
            }
            fill(255);
          }
          square(ls[i].x, ls[i].y, 30);
          noFill();
          stroke(c[i]);
          circle(ls[i].x, ls[i].y, counter[i]);
        } else {
          noStroke();
          fill(c[i], spawn[i]);
          if (sel.dist(ls[i])<20) {
            if (mousePressed) {
              despawn(i);
            }
            fill(255);
          }
          square(ls[i].x, ls[i].y, 30);
        }
      } else {
        if (spawn[i]>255) {
          counter[i]+=0.7234;
          noStroke();
          //color from array for spawner to be
          fill(c[i]);
          if (sel.dist(ls[i])<20) {
            if (mousePressed) {
              despawn(i);
            }
            fill(255);
          }
          square(ls[i].x, ls[i].y, 30);
          noFill();
          stroke(c[i]);
          circle(ls[i].x, ls[i].y, counter[i]);
        } else {
          noStroke();
          fill(c[i], spawn[i]);
          if (sel.dist(ls[i])<20) {
            if (mousePressed) {
              despawn(i);
            }
            fill(255);
          }
          square(ls[i].x, ls[i].y, 30);
        }
      }
      for (int j = 0; j<enemies; j++) {
        if (j!=i) {
          if (ls[i].dist(ls[j])<counter[i]/2+counter[j]/2 && counter[i]>45&&counter[j]>45) {
            if (ls[i].dist(ls[j])<(counter[i]-9)/2+(counter[j]-9)/2) {
              // println("safe inside");
            } else {
               println(1/0);
            }
          }
        }
      }
    }
  }
  //set to random position and set counter 0 spawn 0
  void despawn(int i) {
    println(lvl);

    spawn[i] = 0;
    counter[i] = 0;
    //even goes on left odd goes on right side
    if (i%2==0) {
      ls[i].set(random(350), random(800));
    } else {
      ls[i].set(random(450, 800), random(800));
    }
  }
}
