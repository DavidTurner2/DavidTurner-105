
class Boss {
  //health
  int health = 10000;
  //alive
  boolean alive = true;
  //pvector for position
  PVector p = new PVector(100, 400);
  //sizes
  float sx = 350;
  float sy = 350;
  //slide for going to random position
  float slide = 1;
  //slide values for after image
  float slide2[]= {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  //lerping to random posiotns
  float to = 100;
  //degrading the after ima
  float[] degrade ={0, 0, 0, 0, 0, 0, 255};

  PVector prev[] = {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), };
  Boss() {
  }
  void update() {
    //after images
    for (int i = 1; i<5; i++) {
      slide2[i]+=i*0.5;
      prev[i].lerp(p, constrain(0.1*slide2[i], 0, 1));
      degrade[4-i]-=i*1.2;
      tint(150+i*-20, 150+i*10, i*63, degrade[i]);
      image(boss, prev[i].x, prev[i].y, sx, sy);
    }
    //increase slide to put it to its new position
    if (alive) {
      slide+=0.23430;
    }
    //hurt tinting
    tint(lerpColor(#ff123a, #ffffff, slide), 255);
    //lerp to new position
    p.lerp(to, 400, 0, constrain(slide, 0, 1));
    noStroke();
    //red
    fill(#ff0000);
    //radial timer when about to hit
    arc(p.x+100, p.y, 50, 50, 0, map(time, 0, 10, 0, 2*PI), PIE);

    image(boss, p.x, p.y, sx, sy);
  }
  //hurt and do something elese when dead
  void hurt() {
    if (alive) {
      //play a random hurt sound
      int a =int(random(hurt.length));
      if (!hurt[a].isPlaying()) {
        hurt[a].play(random(0.4, 0.7));
      }
      //2 steppn 
      step2 = 0;
      //reset degrading for after images and speeds and  
      for (int i =0; i<degrade.length; i++) {
        degrade[i]=100;
        prev[i] = new PVector(p.x, p.y);
        slide2[i]=0;
      }
      //slide = 0
      slide = 0;
      //subtract health
      health-=5;
      //if killed
      if (health<0) {
        step2 = 1;
        alive = false;
      }
      //set new position to lerp to
      to=random(-120, 400);
    }
  }
}
