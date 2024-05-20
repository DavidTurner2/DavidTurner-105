class Button {
  PVector position = new PVector(0, 0);
  String text = "";
  float textAdjust = 0;
  color background;
  color textColor;
  float hover = 0;
  float amt = 0;
  float step = 0;
  int level;
  boolean selected = false;
  String mode;
  Button() {
  }
  void update(PVector a, String t, float x, color b, color bc, int change, String m, float sx, float sy) {
    position.set(a);
    mode = m;
    level = change;
    if (collision(a, sx, sy)) {
      selected = true;
      hover = 4*sin(step/2);
      amt = 0;
      step+=0.1;
      fill(100, 100, 150+100*abs(tan(frameCount/49.009)));
    } else {
      selected = false;
      amt+=0.1;
      step = 0;
      hover = lerp(hover, 0, constrain(amt, 0, 1));
      fill(b);
    }
    pushMatrix();
    textSize(20);
    stroke(0);
    translate(0, hover);
    rect(a.x, a.y, sx, sy+-hover/8, 20);
    fill(bc);
    text(t, a.x+25+x, a.y+27);
    popMatrix();
  }

  void activate() {
    if (selected&&mode =="") {
      lvl = level;
    } else if (selected&&mode =="quit") {
      age.setInt("age", 0);
      saveJSONObject(age, "data/j.json");
      q=9000000;
    } else if (selected&&mode=="no") {

      if ((lvl+1)%12==0) {
        increment+=2;
      } else {
        increment++;
      }
      question.visible=false;
    } else if (selected&&mode=="age") {
      if (year==year()-18) {
        if (month==month()) {
          if (day<=day()) {
            println("wow");
          } else {
            young = true;
            lvl = 1;
          }
        } else if (month<month()) {
          println("wow");
        } else {
          young = true;
          lvl = 1;
        }
      } else if (year<year()-18) {
        println("wow");
      } else {
        young = true;
        lvl = 1;
      }
    }
  }
}

class Window {
  //pvector for the whole window
  PVector w = new PVector(0, 0);
  float ww;
  float wh;
  boolean visible;
  boolean completed = false;
  Button yes= new Button();
  Button no= new Button();
  //fake timer
  int m = 2;
  int s = 59;
  int abc = 0;
  int defg = 0;
  Window() {
  }
  void update(PVector window, float x, float y, float adj, float adj2, PVector button, PVector button2) {
    if (visible) {

      w.set(window);
      ww= x;
      wh = y;
      fill(255);
      rect(w.x, w.y, x, y);
      fill(0);
      text(nf(m, 2)+":"+nf(s, 2), w.x+adj, w.y+adj2);
      textSize(20);
      text("are you under 18?", w.x+20, w.y+adj2+30);
      PVector um = new PVector(w.x+button.x, w.y+button.y);
      PVector um2 = new PVector(w.x+button2.x, w.y+button2.y);

      yes.update(um, "Yes", -13, 159, 6, 1, "quit", 50, 32);

      no.update(um2, "No", -9, 159, 6, lvl, "no", 50, 32);


      if (frameCount%5==0) {
        //if (m<0) {
        // young = true;
        //  lvl = 1;
        //}
        if (s>0) {
          s--;
        } else {
          m--;
          s=59;
        }
      }
    } else {
      m = 2;
      s = 59;
    }
  }
  void activate() {
    if (visible) {
      yes.activate();
      no.activate();
    }
  }
}
