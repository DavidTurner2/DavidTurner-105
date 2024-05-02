class Poem {
  //text positions
  PVector[] text;
  //current selected
  int selected=0;
  //list of words
  String[] list;
  //boolean varibale check if dragging
  boolean dragging = false;
  //speed
  float speed;
  //setting random rotation in negative or positive sign
  float sign;
  float[] rotation;
  Poem(String s) {
    //split string into words and put it to list array
    list = split(s, " ");
    //set the size of the texts and their rotations
    text = new PVector[list.length];
    rotation = new float[list.length];
    //initialize the rotation and pvector values and get rid of the a's
    for (int i = 0; i<list.length; i++) {
      if (i<9) {
        text[i] = new PVector(99880, 99880);
      } else {
        text[i] = new PVector(0, 0);
      }
      rotation[i] = 0;
    }

//start spiral at 9 and set positions
    for (int i=9; i< list.length; i++) {
      float  angle = -6.10 * i*0.98816;
      double x=(-24+angle)*Math.cos(angle);
      double y=(-4+angle)*Math.sin(angle);
      text[i].set((float)x, (float)y);
    }
  }

  void display() {
    //display text if its selected and dragging then rotate it randomoly
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
    //when mosuse pressed
    if (mousePressed) {
      //set speed based on the word size
      speed+=(0.0049/(list[selected].toString().length()));
    } else {
      speed = 0;
      sign = int(random(-2, 2));
    }
  
    if (dragging) {
      if (sign == 0) {
        sign = -1;
      }
      //maximum speed
      if (speed >0.049/(list[selected].toString().length())) {

        speed = 0.049/(list[selected].toString().length());
      }
      //rotate
      rotation[selected]+=sign*speed*0.5;
      //lerp to circle cursor using speed from text selected
      text[selected].x = lerp(text[selected].x, circle.x, speed);
      text[selected].y = lerp(text[selected].y, circle.y, speed);
    }
  }

//sets dragging to true and stores which word is selected
  void drag() {

    for (int i = 0; i<list.length; i++) {
      if (circle.x>text[i].x-3&&circle.x<text[i].x+textWidth(list[i])&&circle.y>text[i].y-44&&circle.y<text[i].y+44&&dragging == false) {
        dragging = true;
        selected = i;
      }
    }
  }
}
