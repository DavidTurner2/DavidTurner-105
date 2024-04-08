class Draw {
  StringList col= new StringList();
  StringList col2= new StringList();
  float size;
  boolean draw = false;
  FloatList line = new FloatList();
  FloatList line2 = new FloatList();
  FloatList lines = new FloatList();
  FloatList lines2 = new FloatList();
  FloatList elines = new FloatList();
  FloatList elines2 = new FloatList();
  boolean f = false;
  boolean f2 = true;
  boolean f3 = true;

  String mode = "";
  Draw() {
    erase();
  }

  void pixelColor(color x) {
    //drawing
    if (draw) {
      if (mode == "glitch") {
        col.append(hex(x));
        col.append(hex(x));

        lines2.append(mouseX);
        lines2.append(mouseY);

        lines.append(pmouseX);
        lines.append(pmouseY);
        if (f3 == true) {
          for (int i =0; i<18; i++) {
            lines.append(mouseX);
            lines.append(mouseY);
          }
          f3 = false;
        }
        f = true;
      }
      if ( mode == "normal") {
        col2.append(hex(x));
        col2.append(hex(x));

        line2.append(mouseX);
        line2.append(mouseY);

        line.append(pmouseX);
        line.append(pmouseY);
      }
      if ( mode == "eraser") {

        for (int i = 0; i<line2.size()-1; i++) {
          if (i%2==1) {
            //i have no idea why this works
          } else {
            if (mouseX>line2.get(i)&&mouseY>line2.get(i+1))
             col2.set(i, hex(color(255, 0)));
              //turns lines into dots
              //line2.set(i,line.get(i));
              //line2.set(i+1,line.get(i+1));
              //set to bgc before it changes
              //col2.set(i, hex(color(255, 100*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)))));
          }
        }
      }
    }

    //displaying drawn things

    //glitch lines
    strokeWeight(1);
    for (int i = 0; i<lines2.size()-1; i++) {
      if (i%2==1) {
        //i have no idea why this works
      } else {
        stroke(unhex(col.get(i)));
        line(lines.get(i), lines.get((i+1)), lines2.get(i), lines2.get((i+1)));
      }
    }

    //normal lines
    strokeWeight(4);
    for (int i = 0; i<line2.size()-1; i++) {
      if (i%2==1) {
        //i have no idea why this works
      } else {
        stroke(unhex(col2.get(i)));
        line(line.get(i), line.get((i+1)), line2.get(i), line2.get((i+1)));
      }
    }

    //eraser lines
    strokeWeight(24);
  }

  void erase() {
    lines.clear();
    lines2.clear();
    line.clear();
    line2.clear();
  }

  void fix() {
    if (mode == "glitch"&&f&&f2) {
      if (lines.size()>74) {
        for (int i = 1; i<37; i++) {
          lines.remove(lines.size()-i);
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
