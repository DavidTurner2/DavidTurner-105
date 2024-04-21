
class Shooters {
  //p shooters
  PVector[] p = new PVector[10];
  //bullet array
  PVector[] bullet = new PVector[100];
  //offset the array for bullets the shooters can shoot
  int[] offset={0, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  //directions for the bullets to go
  PVector[] direction = new PVector[100];
  //shooting rates list for the shooters
  IntList times = new IntList(24, 24, 90, 60, 70, 69, 69, 90, 50, 37, 50, 50, 50, 25);
  //temporary value for storing score
  int temp = 0;
  //current amount of enemies
  int enemies = 1;

  Shooters() {
    //reset everything
    restart();
  }
  void update() {
    //when framecount is divisible by 120 then increase score and set temp to score
    if (frameCount%120==0) {
      score++;
      temp = score;
    }
    //every 50 points the shoot times get shuffled
    if (frameCount%(120*50)==0) {
      times.shuffle();
    }
    //loop for checking every 20 points until 180 to ncrease enemy count
    for (int i = 20; i<200; i+=20) {
      //check temp so that it does increase enemie count while its equal
      if (temp == i) {
        //increase temp so that this doesnt run again
        temp++;
        //increase enemies by 1
        enemies++;
      }
    }
    //spawning bullets
    for (int i = 0; i<enemies; i++) {
      //check framecount is divisble by the time of the bullet in the array
      if (frameCount%times.get(i)==0) {
        //offset so that the shooters use maximum of 10 bullets of the 100 bullets
        if (offset[i]>8+i*10) {
          offset[i] = i*10;
        }
        offset[i]++;
        //play ball shoot sound
        ball.play(0.7);
        //set bullet to
        bullet[offset[i]].set(400+p[i].x, 400+p[i].y, 20);

        //check which angle the shooter is on and set direction based on it
        if (p[i].heading()>PI/2) {
          direction[offset[i]].set(4, -1*2+random(4));
        } else if (p[i].heading()<-PI/2) {
          direction[offset[i]].set(random(9), 2+random(4));
        } else if (p[i].heading()>-3*PI/2 && p[i].heading()<0) {
          direction[offset[i]].set(-4, 1+random(4));
        } else if (p[i].heading()<PI/2) {
          direction[offset[i]].set(1, 4*-2+random(4));
        }
      }
    }
    //bullets moving
    //set fill to white
    fill(255);
    for (int i = 0; i<bullet.length; i++) {
      //circle that gets assign to bullet positions
      circle(bullet[i].x, bullet[i].y, 20);
      if (i == 98) {
        //troll bullet make it look like a health but its not
        fill(0, 255, 0);
      }
      //check if player is out of bounds
      //stop bgm play out of bounds music make all spawned bullets go directly towards you
      if (out) {
        bgm.stop();
        if (!bound.isPlaying()) {
          bound.loop();
        }
        bullet[i].lerp(sel, 0.1);
      } else {
        bound.stop();
        if (!bgm.isPlaying()) {
          bgm.loop();
        }
        //if not out of bounds make bullet go towards its direction 
        bullet[i].add(direction[i]);
      }
      //when you get hit by bullets take off health make screen go red and shake using hurt variable
      if (bullet[i].dist(sel)<25) {
        bullet[i].set(random(1000), random(-1000, -900));
        direction[i].set(0, 0);
        player.health--;
        hurt = 0;
      }
    }
    //bunch of rotation speeds
    //println(degrees(p[0].heading()));
    if (score>222) {
      for (int i = 0; i<p.length; i++) {
        p[i].rotate(random(0.09, 0.9));
      }
    } else {
      p[0].rotate(.005);
      p[1].rotate(-.005);
      p[2].rotate(.01);
      p[3].rotate(.0090908);
      p[4].rotate(-.004);
      p[5].rotate(.00523);
      p[6].rotate(.015123);
      p[7].rotate(-.026);
      p[8].rotate(-.007);
      p[9].rotate(.009);
    }
    strokeWeight(1);
    noFill();
    strokeWeight(9);
    //spawning shooters as a bunch of random points going around + 25 - 25
    for (int i =0; i<20; i++) {
      stroke(255, 90);
      for (int j = 0; j<enemies; j++) {
        point(400+p[j].x+random(-25, 25), 400+p[j].y+random(-25, 25));
      }
    }
  }
  void restart() {
    //spawn all the bullets offscreen set their direction to 0
    for (int i = 0; i<bullet.length; i++) {
      bullet[i] = new PVector(-900, -900);
      direction[i] = new PVector(0, 0);
    }
    //spawn all shooters randomoly on the circle
    for (int i = 0; i<10; i++) {
      p[i] = new PVector(400/1.5, 400/1.5);
      p[i].rotate(random(-4, 4));
    }
  }
}
