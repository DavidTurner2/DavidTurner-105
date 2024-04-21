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
  boolean[] lvl = {true};
  //colors for each level of spawners
  color[] c = new color[100];
  //when the circle goes out of bounds
  float out = 1738;

  Spawners() {
    //set colors for each level with for loops
    for (int i = 0; i<2; i++) {
      c[i] = color(random(100, 255), random(100, 255), random(100, 255));
    }
    for (int i = 2; i<5; i++) {
      c[i] = color(random(100, 255), random(100, 255), random(100, 255));
    }
    for (int i = 5; i<10; i++) {
      c[i] = color(random(100, 255), random(100, 255), random(100, 255));
    }
    for (int j = 0; j<9; j++) {
      for (int i = 10+j*10; i<20+j*10; i++) {
        c[i] = color(random(100, 255), random(100, 255), random(100, 255));
      }
    }
    //set random spawn times and set eveything to 0
    for (int i = 0; i<100; i++) {
      spawnTime[i] = random(0.1, 1.5);
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
    for (int i = 0; i<2; i++) {
      if (counter[i]>out) {
      }
    }
    for (int i = 0; i<5; i++) {
    }
    for (int j = 0; j<10; j++) {
      for (int i = 0; i<10+j*10; i++) {
      }
    }



    //increment all spawn values by the random spawn times for each
    for (int i = 0; i<100; i++) {
      spawn[i]+=spawnTime[i];
    }
    //only loop to current enemies
    for (int i = 0; i<enemies; i++) {
      //when you select around the center of a spawner it despawns the spawner
      if (sel.dist(ls[i])<20) {
        if (mousePressed) {
          despawn(i);
        }
      }
      //even goes on left odd goes on right side
      if (i%2==0) {
        if (spawn[i]>255) {
          println("Out");
          counter[i]+=0.8234;
          noStroke();
          fill(c[i]);
          square(ls[i].x, ls[i].y, 30);
          noFill();
          stroke(c[i]);
          circle(ls[i].x, ls[i].y, counter[i]);
        } else {
          noStroke();
          fill(c[i], spawn[i]);
          square(ls[i].x, ls[i].y, 30);
        }
      } else {
        if (spawn[i]>255) {
          counter[i]+=0.90091;
          noStroke();
          fill(c[i]);
          square(ls[i].x, ls[i].y, 30);
          noFill();
          stroke(c[i]);
          circle(ls[i].x, ls[i].y, counter[i]);
        } else {
          noStroke();
          fill(c[i], spawn[i]);
          square(ls[i].x, ls[i].y, 30);
        }
      }
      for (int j = 0; j<enemies; j++) {
        if (j!=i) {
          if (ls[i].dist(ls[j])<counter[i]/2+counter[j]/2 && counter[i]>45&&counter[j]>45) {
            if (ls[i].dist(ls[j])<(counter[i]-9)/2+(counter[j]-9)/2) {
              // println("safe inside");
            } else {
              // println("1/0");
            }
          }
        }
      }
    }
  }
  //set to random position and set counter 0 spawn 0
  void despawn(int i) {
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
