class PushUps {
  float push = 0;
  float penalty = 0;
  String[] qwe = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"};
  boolean left = true;
  int curr = 0;
  boolean end = false;
  float gtime = 0;
  PushUps() {
  }

  void update() {

    if (end) {
      fill(255);
      textSize(30);
      text("TIME: "+gtime+" Seconds", 200, 390);

      goTo.update(new PVector(488, 203), "UNPOLISH NEXT", -22, 159, 5, 7, "", sx, sy);
      restart.update(new PVector(100, 204), " RESTART", -22, 159, 6, 6, "", sx, sy);
    } else {
      if (frameCount%60==0) {
        gtime++;
      }
      fill(#75D2F2);
      rect(0, 100, 800, 800);
      fill(255);
      if (constrain(100+push-penalty, 100, 800)<=100) {
        push=0;
        penalty = 0;
      }
      if (push>0) {
        penalty+=0.08;
      }
      if (constrain(100+push-penalty, 100, 800)>400) {
        end=true;
      }

      rect(constrain(100+push-penalty, 100, 800), 400, -1000, 100);
      rect(constrain(700-push+penalty, 0, 700), 400, 1000, 100);
      textSize(30);
      if (left) {
        text(qwe[curr], 50, 300);
        if (keyPressed) {
          if (key==qwe[curr].toLowerCase().charAt(0)||key==qwe[curr].charAt(0)) {
            push+=12;
            curr=int(random(qwe.length));
            left = !left;
          }
        }
      } else {
        text(qwe[curr], 750, 300);
        if (keyPressed) {
          if (key==qwe[curr].toLowerCase().charAt(0)||key==qwe[curr].charAt(0)) {
            push+=12;
            curr=int(random(qwe.length));
            left = !left;
          }
        }
      }
    }
  }
  void restart() {
    end = false;
    push=0;
    penalty = 0;
  }
}
