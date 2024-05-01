class Button {
  PVector pos = new PVector(0, 0);
  float size = 20;
  String mode;
  boolean selected = false;
  Button(float x, float y, String z) {
    pos.set(x, y);
    mode = z;
  }
  void position() {
    if (pos.dist(sel)<size) {
      selected = true;

      fill(100);
    } else {
      selected = false;
      fill(255);
    }
    if (p.mode==mode) {
      fill(100);
    }
    circle(pos.x, pos.y, size);
    textSize(13);
    text(mode, pos.x-10, pos.y+21);
  }

  void activate() {
    if (selected) {
      if (mode == "erase") {
        p.erase();
      } else {
        p.mode = mode;
      }
    }
  }
}
