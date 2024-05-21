class NumberArea {
  PVector pos = new PVector(0, 0);
  float w = 90;
  float h = 40;
  String text = "";
  float value = 0;
  int increment = 0;
  float prev;
  //initialize array of saved values
  String[] saved = new String[20];
  boolean init = false;
  NumberArea(float x) {
    //initialize array of saved values
    for ( int i= 0; i<20; i++) {
      saved[0]="";
    }
    prev = x;
    value = x;
    text = ""+x;
    init = true;
  }
  //method sets position and other logic
  void position(float x, float y) {
    pos.set(x, y);
    //rectangle areaa
    noStroke();
    fill(255);

    rect(pos.x, pos.y, w, h);
    strokeWeight(1);

    //text length is less than 6
    if (float(text)>0) {
      value = float(text);
    }
    fill(0);

    stroke(0, 255*1/sin(frameCount/10.034));


    //blinking line for typing
    textSize(15);

    if (collision(pos, w, h)) {
      line(pos.x+1+textWidth(text), pos.y, pos.x+1+textWidth(text), pos.y+30);
    }

    //display text but seperate the hashtag
    text(text, pos.x+2, pos.y+25);
  }
  void reset() {
    init = true;
    increment = 0;
    value=prev;
    text = ""+prev;
  }
}
