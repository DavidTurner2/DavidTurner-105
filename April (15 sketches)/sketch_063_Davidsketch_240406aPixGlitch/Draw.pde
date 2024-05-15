class Points {
  float x, y;
  Points(float x2, float y2) {
    x = x2;
    y = y2;
  }
}

class Rectangles {
  float x, y, wide, high;
  String wd;
  Rectangles(float x2, float y2, float w, float h) {
    x = x2;
    y = y2;
    wide=w;
    high = h;
  }
}


class Draw {
  //list of color of glitch lines;
  StringList glitchColor= new StringList();
  //size of glitch lines
  FloatList glitchSize = new FloatList();

  //lists of colors and sizes for the modes
  StringList lineColor= new StringList();
  FloatList lineSize = new FloatList();
  StringList textColor = new StringList();
  //text type for displaying which text gets displayed
  StringList textType = new StringList();
  FloatList textSize = new FloatList();
  StringList pointColor= new StringList();
  FloatList pointSize = new FloatList();
  StringList rectColor = new StringList();
  FloatList rectSize = new FloatList();
  StringList ellipseColor = new StringList();
  FloatList ellipseSize = new FloatList();
  //list of text to choose from
  String[] abc = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};

  //order to display those lines
  ArrayList <Order> order = new ArrayList<Order>();
  ArrayList <Order> redo = new ArrayList<Order>();


  //boolean to check if drawing
  boolean draw = false;




  //regular lines
  ArrayList <Points> line = new ArrayList<Points>();
  //text
  ArrayList <Rectangles> wd = new ArrayList<Rectangles>();
  //points
  ArrayList <Points> trig = new ArrayList<Points>();
  //rectangles
  ArrayList <Rectangles> rectangles = new ArrayList<Rectangles>();
  ArrayList <Rectangles> ellipses = new ArrayList<Rectangles>();


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
      //if mode is glitch run glitch method
      if (mode == "glitch") {
        glitch(x);
      }
      //if mode is normal or eraser
      if ( mode == "normal"||mode=="eraser") {

        lineSize.append(y);
        order.add(new Order("n", lineSize.size()));
        lineSize.append(y);
        order.add(new Order("n", lineSize.size()));

        //if mode is normal append current color if its eraser append the letter e
        if (mode=="normal") {
          lineColor.append(hex(x));
          lineColor.append(hex(x));
        } else {
          lineColor.append("e");
          lineColor.append("e");
        }
        line.add(new Points(mouseX, mouseY));
        line.add(new Points(pmouseX, pmouseY));
      }
      //adding text
    }

    //DISPLAYING drawn things

    //in order of when they were placed
    for (int j = 0; j<order.size(); j++) {
      //NORMAL LINES
      if (order.get(j).type=="n"&&j<order.size()-1) {
        //get rid of symmetry
        if (j%2==1) {
        } else {
          strokeWeight(lineSize.get(order.get(j).value-1));
          if (lineColor.get(order.get(j).value-1)=="e") {
            stroke(bgc);
          } else {
            stroke(unhex(lineColor.get(order.get(j).value-1)));
          }
          line(line.get(order.get(j).value-1).x, line.get(order.get(j).value-1).y, line.get(order.get(j).value).x, line.get(order.get(j).value).y);
        }
      }
      //GLITCH LINES
      if (order.get(j).type=="g"&&j<order.size()-1) {
        strokeWeight(1);
        //get rid of symmetry
        if (j%2==1) {
        } else {
          stroke(unhex(glitchColor.get(order.get(j).value-1)));
          line(glitchLines.get(order.get(j).value-1), glitchLines.get((order.get(j).value)), glitchLines2.get(order.get(j).value-1), glitchLines2.get((order.get(j).value)));
        }
      }
      //TEXT
      if (order.get(j).type=="wd") {
        fill(unhex(textColor.get(order.get(j).value)));
        textFont(wingdings, textSize.get(order.get(j).value));
        text(wd.get(order.get(j).value).wd, wd.get(order.get(j).value).x, wd.get(order.get(j).value).y);
      }
      //TRIGONOMETRY
      if (order.get(j).type=="trig") {
        stroke(unhex(pointColor.get(order.get(j).value)));
        strokeWeight(pointSize.get(order.get(j).value));
        point(trig.get(order.get(j).value).x, trig.get(order.get(j).value).y);
      }
      //RECTANGLES
      if (order.get(j).type=="rectangle") {
        stroke(unhex(rectColor.get(order.get(j).value)));
        strokeWeight(rectSize.get(order.get(j).value));
        noFill();
        rect(rectangles.get(order.get(j).value).x,
          rectangles.get(order.get(j).value).y,
          rectangles.get(order.get(j).value).wide,
          rectangles.get(order.get(j).value).high);
      }
      if (order.get(j).type=="ellipse") {
        stroke(unhex(ellipseColor.get(order.get(j).value)));
        strokeWeight(ellipseSize.get(order.get(j).value));
        noFill();
        ellipse(ellipses.get(order.get(j).value).x,
          ellipses.get(order.get(j).value).y,
          ellipses.get(order.get(j).value).wide,
          ellipses.get(order.get(j).value).high);
      }
    }
  }
  //code resets and clears all lists and objects
  void erase() {

    wd.clear();
    textColor.clear();
    textSize.clear();
    textType.clear();
    order.clear();
    line.clear();
    trig.clear();
    rectangles.clear();
    rectSize.clear();
    ellipses.clear();
    ellipseSize.clear();
    rectColor.clear();
    ellipseColor.clear();
    pointColor.clear();
    pointSize.clear();
    glitchLines.clear();
    glitchLines2.clear();
    glitchColor.clear();
    lineColor.clear();
    lineSize.clear();
  }

  //remove from order by type and decrease incrementor
  void undo() {
    if (order.size()>0) {
      order.remove(order.size()-1);
    }
  }



  //trigonametric point adding
  void trig(color x, float y, PVector sine, float amp, int sineLength, int sinSpace, float sineOffset) {
    if (mode == "sine"||mode=="tangent") {
      for (int i = 0; i<sineLength; i++) {
        if (mode == "sine") {
          order.add(new Order("trig", pointSize.size()));
          pointSize.append(y);
          pointColor.append(hex(x));
          if (slanted) {
            trig.add(new Points(sine.x+i*sinSpace, sine.y+amp*sin(i/9.009+sineOffset)+i*map(sel.y, sinePos.y, sinePos.y+height, 1, 10)));
          } else {
            trig.add(new Points(sine.x+i*sinSpace, sine.y+amp*sin(i/9.009+sineOffset)));
          }
        } else if (mode == "tangent") {
          order.add(new Order("trig", pointSize.size()));
          pointSize.append(y);
          pointColor.append(hex(x));
          trig.add(new Points(sine.x+i*sinSpace, sine.y+amp*tan(i/9.009+sineOffset)));
        }
      }
    }
  }

  void rectangle(color x, float y, PVector rec, float wide, float high) {
    rectColor.append(hex(x));
    order.add(new Order("rectangle", rectSize.size()));
    rectSize.append(y);
    rectangles.add(new Rectangles(rec.x, rec.y, wide, high));
  }

  void ell(color x, float y, PVector rec, float wide, float high) {
    ellipseColor.append(hex(x));
    order.add(new Order("ellipse", ellipseSize.size()));
    ellipseSize.append(y);
    ellipses.add(new Rectangles(rec.x, rec.y, wide, high));
  }

  void wd(color x, float y, PVector rec) {
    textColor.append(hex(x));
    order.add(new Order("wd", textSize.size()));
    textSize.append(y);
    wd.add(new Rectangles(rec.x, rec.y, 0, 0));
    wd.get(textSize.size()-1).wd = wing;
  }
  //make glitchy lines
  void glitch(color x) {
    glitchLines2.append(mouseX);
    glitchLines2.append(mouseY);
    glitchColor.append(hex(x));
    order.add(new Order("g", glitchColor.size()));
    glitchColor.append(hex(x));
    order.add(new Order("g", glitchColor.size()));
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
