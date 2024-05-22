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
    stroke(0);
    translate(0, hover);
    rect(a.x, a.y, sx, sy+-hover/8, 20);
    fill(bc);
    textSize(20);

    text(t, a.x+25+x, a.y+27);
    popMatrix();
  }

  void activate() {
    if (selected&&mode=="") {
      minigame = level;
    }
    if (selected&&mode=="end") {
      m2.restart();
      minigame = level;
    }
  }
}
