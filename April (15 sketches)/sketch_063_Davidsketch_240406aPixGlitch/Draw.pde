class Points {
  float x, y;
  Points(float x2, float y2) {
    x = x2;
    y = y2;
  }
}




class Draw {
  //list of color of glitch lines;
  StringList glitchColor= new StringList();
  //list of color of normal lines
  StringList lineColor= new StringList();
  //size of glitch lines
  FloatList glitchSize = new FloatList();
  //size of normal lines
  FloatList lineSize = new FloatList();
  StringList textColor = new StringList();
  StringList textType = new StringList();
  FloatList textSize = new FloatList();

  String[] abc = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};

  //order to display those lines
  ArrayList <Order> order = new ArrayList<Order>();
  ArrayList <Order> redo = new ArrayList<Order>();
  int glitch = 0;
  int normal = 0;
  int text = 0;
  //boolean to check if drawing
  boolean draw = false;




  //regular lines
  ArrayList <Points> line = new ArrayList<Points>();
  ArrayList <Points> wd = new ArrayList<Points>();

  //glitch lines
  FloatList glitchLines = new FloatList();
  FloatList glitchLines2 = new FloatList();
  //boolean variables for fixing glitchLines so that they arent always connected
  boolean f = false;
  boolean f2 = true;
  boolean f3 = true;
  //the mode of which things to perform when clicking
  String mode = "";
  Draw() {
    erase();
  }
  void pixelColor(color x, float y) {
    //drawing
    if (draw) {
      if (mode == "glitch") {
        glitch(x);
      }
      if ( mode == "normal"||mode=="eraser") {
        order.add(new Order("n", normal));
        normal++;
        order.add(new Order("n", normal));
        normal++;

        if (mode=="normal") {
          lineColor.append(hex(x));
          lineColor.append(hex(x));
        } else {

          lineColor.append("e");
          lineColor.append("e");
        }
        lineSize.append(y);
        lineSize.append(y);

        line.add(new Points(mouseX, mouseY));
        line.add(new Points(pmouseX, pmouseY));
      }
      if (mode=="WD") {
        if (frameCount%7==0) {
          order.add(new Order("wd", text));
          order.add(new Order("wd", text));
          text++;
          textColor.append(hex(x));
          textType.append(abc[int(random(abc.length))]);
          textSize.append(map(y, 4, 40, 40, 80));
          wd.add(new Points(mouseX+random(-30, 10), mouseY+random(-30, 10)));
        }
      }
    }

    //displaying drawn things

    //in order of when they were placed
    for (int j = 0; j<order.size()-1; j++) {
      //NORMAL LINES
      if (order.get(j).type=="n") {
        //get rid of symmetry
        if (j%2==1) {
        } else {
          strokeWeight(lineSize.get(order.get(j).value));
          if (lineColor.get(order.get(j).value)=="e") {
            stroke(bgc);
          } else {
            stroke(unhex(lineColor.get(order.get(j).value)));
          }
          line(line.get(order.get(j).value).x, line.get(order.get(j).value).y, line.get(order.get(j).value+1).x, line.get(order.get(j).value+1).y);
        }
      }
      //GLITCH LINES
      if (order.get(j).type=="g") {
        strokeWeight(1);
        //get rid of symmetry
        if (j%2==1) {
        } else {
          stroke(unhex(glitchColor.get(order.get(j).value)));
          line(glitchLines.get(order.get(j).value), glitchLines.get((order.get(j).value+1)), glitchLines2.get(order.get(j).value), glitchLines2.get((order.get(j).value+1)));
        }
      }
      //TEXT
      if (order.get(j).type=="wd") {
        fill(unhex(textColor.get(order.get(j).value)));
        textFont(wingdings, textSize.get(order.get(j).value));
        text(textType.get(order.get(j).value), wd.get(order.get(j).value).x, wd.get(order.get(j).value).y);
      }
    }
  }
  //code resets and clears all lists and objects
  void erase() {
    glitch = 0;
    normal = 0;
    text = 0;
    wd.clear();
    order.clear();
    line.clear();
    glitchLines.clear();
    glitchLines2.clear();
    glitchColor.clear();
    lineColor.clear();
    lineSize.clear();
  }
  
  void undo() {
    for (int j = 0; j<order.size()-1; j++) {
      if (order.get(j).type =="n") {
        if (j%2==1) {
          normal--;
        } else {
          redo.add(order.get(order.size()-1-j));
          order.remove(order.size()-1-j);
          redo.add(order.get(order.size()-1-j));
          order.remove(order.size()-1-j);
          return;
        }
      }

      if (order.get(j).type =="g") {
        if (j%2==1) {
          glitch--;
        } else {
          redo.add(order.get(order.size()-1-j));
          order.remove(order.size()-1-j);
          redo.add(order.get(order.size()-1-j));
          order.remove(order.size()-1-j);
          return;
        }
      }

      if (order.get(j).type =="wd") {
        redo.add(order.get(order.size()-1-j));
        order.remove(order.size()-1-j);
        redo.add(order.get(order.size()-1-j));
        order.remove(order.size()-1-j);
        return;
      }
    }
  }

  void trig(color x, float y,PVector sine,PVector sine2, float amp, int sineLength, int sinSpace,float sineOffset) {
    if (mode == "sine"||mode=="tangent") {
      for (int i = 0; i<sineLength; i++) {
        lineColor.append(hex(x));
        lineColor.append(hex(x));
        lineSize.append(y);
        lineSize.append(y);
        if (mode == "sine") {
          order.add(new Order("n", normal));
          normal++;
          order.add(new Order("n", normal));
          normal++;
          line.add(new Points(sine.x+i*sinSpace, sine.y+amp*sin(i/9.009+sineOffset)));
          line.add(new Points(sine2.x+i*sinSpace, sine2.y+amp*sin(i/9.009+sineOffset)));
        } else if (mode == "tangent") {
          order.add(new Order("n", normal));
          normal++;
          order.add(new Order("n", normal));
          normal++;
          line.add(new Points(sine.x+i*sinSpace, sine.y+amp*tan(i/9.009+sineOffset)));
          line.add(new Points(sine2.x+i*sinSpace, sine2.y+amp*tan(i/9.009+sineOffset)));
        }
      }
    }
  }

  //make glitchy lines
  void glitch(color x) {
    glitchLines2.append(mouseX);
    glitchLines2.append(mouseY);
    glitchColor.append(hex(x));
    glitchColor.append(hex(x));
    order.add(new Order("g", glitch));
    glitch++;
    order.add(new Order("g", glitch));
    glitch++;
    glitchLines.append(pmouseX);
    glitchLines.append(pmouseY);
    if (f3 == true) {
      for (int i =0; i<18; i++) {
        glitchLines.append(mouseX);
        glitchLines.append(mouseY);
      }
      f3 = false;
    }
    f = true;
  }
  //fix glitchy lines
  void fix() {
    if (mode == "glitch"&&f&&f2) {
      if (glitchLines.size()>74) {
        for (int i = 1; i<37; i++) {
          glitchLines.remove(glitchLines.size()-i);
          f = false;
          f2 = false;
        }
      }
    }
    if (f2 == false) {
      f2 = true;
      f3 = true;
    }
  }
}

class Order {
  String type;
  int value;
  Order(String t, int val) {
    value = val;
    type = t;
  }
}
