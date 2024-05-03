
class Boss {
  int health = 10000;
  boolean alive = true;
  PVector p = new PVector(100, 400);
  //sizes
  float sx = 350;
  float sy = 350;
  //slide for going to random position
  float slide = 1;
  //slide values for after image
  float slide2[]= {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  float to = 100;
  float[] degrade ={0, 0, 0, 0, 0, 0, 255};
  float direction = 20;
  PVector prev[] = {new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), new PVector(0, 0), };
  Boss() {
  }
  void update() {
    for (int i = 1; i<5; i++) {
      slide2[i]+=i*0.5;
      prev[i].lerp(p, constrain(0.1*slide2[i], 0, 1));

      degrade[4-i]-=i*1.2;
      tint(150+i*-20, 150+i*10, i*63, degrade[i]);
      image(boss, prev[i].x, prev[i].y, sx, sy);
    }
    //increase slide to put it to its new position
    if(alive){
    slide+=0.23430;
    }
    
    tint(lerpColor(#ff123a, #ffffff, slide), 255);
    p.lerp(to, 400, 0, constrain(slide, 0, 1));
    image(boss, p.x, p.y, sx, sy);
  }
//hurt and do something elese when dead
  void hurt() {
    if(alive){
    for (int i =0; i<degrade.length; i++) {
      degrade[i]=100;
      prev[i] = new PVector(p.x, p.y);
      slide2[i]=0;
    }
    slide = 0;
    health-=1;
    if(health<0){
      alive = false;
    }
    to=random(0, 400);
    }
  }
}
