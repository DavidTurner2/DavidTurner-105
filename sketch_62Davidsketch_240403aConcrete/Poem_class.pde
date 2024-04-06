class Poem {
  PVector[] text;
  int selected=0;
  String[] list;
  boolean dragging = false;
  Poem(String s, float positionx, float positiony) {
    list = split(s, " ");
    text = new PVector[list.length];

    for (int i = 0; i<list.length; i++) {
      text[i] = new PVector(0, 0);
    }
    for (int i = 0; i<list.length; i++) {
      if (i<=list.length/6) {
        text[i].set(positionx+125*cos(i), positionx+125*sin(i));
      } else if (i<=list.length/2.5) {
        text[i].set(positionx+62.5*cos(i), positionx+62.5*sin(i));
      } else {
        text[i].set(positionx+250*cos(i), positionx+250*sin(i));
      }
    }
  }

  void display() {
    for (int i = 0; i<list.length; i++) {
      text(list[i], text[i].x, text[i].y);
    }
  }

  void drag() {
    if (dragging) {
      text[selected].set(circle);
    }
    for (int i = 0; i<list.length; i++) {
      if (circle.dist(text[i])<r&& dragging == false) {
        dragging = true;
        selected = i;
      }
    }
  }
}
