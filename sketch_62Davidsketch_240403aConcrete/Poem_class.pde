class Poem {
  PVector[] text;
  int selected=0;
  String[] list;
  boolean dragging = false;
  float speed;
  float sign;
  float[] rotation;
  Poem(String s, float positionx, float positiony) {
    list = split(s, " ");
    text = new PVector[list.length];
    rotation = new float[list.length];

    for (int i = 0; i<list.length; i++) {
      text[i] = new PVector(0, 0);
      rotation[i] = 0;
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
      if (i == selected&&dragging) {
        pushMatrix();
        translate(text[selected].x, text[selected].y);
        rotate(sin(rotation[i]/2));
        translate(-text[selected].x, -text[selected].y);
        text(list[i], text[i].x, text[i].y);
        popMatrix();
      } else {
        pushMatrix();
        translate(text[i].x, text[i].y);
        rotate(sin(rotation[i]/2));
        translate(-text[i].x, -text[i].y);
        text(list[i], text[i].x, text[i].y);
        popMatrix();
      }
    }
    if (mousePressed) {
     
      speed+=(0.0049/(list[selected].toString().length()));
    } else {
      speed = 0;
      sign = int(random(-2, 2));
    }

    if (dragging) {
      if (sign == 0) {
        sign = -1;
      }
       if(speed >0.049/(list[selected].toString().length())){

        speed = 0.049/(list[selected].toString().length());
      }
      rotation[selected]+=sign*speed*0.5;
      
      text[selected].x = lerp(text[selected].x, circle.x, speed);
      text[selected].y = lerp(text[selected].y, circle.y, speed);
    }
  }


  void drag() {

    for (int i = 0; i<list.length; i++) {
      if (circle.x>text[i].x-3&&circle.x<text[i].x+textWidth(list[i])&&circle.y>text[i].y-44&&circle.y<text[i].y+44&&dragging == false) {
        dragging = true;
        selected = i;
      }
    }
  }
}
