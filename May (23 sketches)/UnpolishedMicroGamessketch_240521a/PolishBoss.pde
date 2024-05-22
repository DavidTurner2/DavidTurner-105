class PolishBoss {
  PVector[] enemy = new PVector[7];
  int[] health = new int[7];
  boolean selected = false;
  int selection;
  int power = 1;
  int missed = 0;
  float gtime;

  PolishBoss() {
    restart();
  }
  void update() {
    if(frameCount%60==0){
      gtime++;
    }
    for (int i = 0; i<enemy.length; i++) {
      if (health[i]<100) {
        for (int j = 0; j<health[i]; j++) {
          stroke(251, 2, 8);
          strokeWeight(2.0);
          line(-50+enemy[i].x+j, 50+enemy[i].y, -50+enemy[i].x+j, 50+enemy[i].y);
        }
      }
      if(health[i]>0){
      enemy[i].set(400+300*cos(i*1.009+frameCount/99.009), 400+300*sin(i/2+frameCount/99.009));
      fill(255);
      if (sel.dist(enemy[i])<25) {
        fill(200);
        selection = i;
        selected = true;
      }
      noStroke();
      circle(enemy[i].x, enemy[i].y, 50);
      }
    }
  }
  void restart() {
    power = 1;
    missed = 0;
    gtime=0;
    for (int i=0; i<enemy.length; i++) {
      enemy[i]=new PVector(0, 0);
      health[i]=100;
    }
  }
  void activate() {
    if (selected) {
      health[selection]-= power;
      power++;
      println(power);
    } else {
      power=1;
      missed++;
    }
  }
}
