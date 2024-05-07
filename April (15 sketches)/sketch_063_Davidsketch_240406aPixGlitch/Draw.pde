class Points {
  float x, y;
  Points(float x2, float y2) {
    x = x2;
    y = y2;
  }
}


class Draw {
  StringList glitchColor= new StringList();
  StringList lineColor= new StringList();
  FloatList glitchSize = new FloatList();
  FloatList lineSize = new FloatList();

  //boolean to check if drawing
  boolean draw = false;


  //regular lines
  ArrayList <Points> line = new ArrayList<Points>();

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
      if ( mode == "normal") {
        lineColor.append(hex(x));
        lineColor.append(hex(x));
        lineSize.append(y);
        lineSize.append(y);

        line.add(new Points(mouseX, mouseY));
        line.add(new Points(pmouseX, pmouseY));
      }
      if ( mode == "deleteglitchLines") {
        //erase normal glitchLines
        for (int i = 0; i<line.size()-1; i++) {
          if (i%2==1) {
            //i have no idea why this works
          } else {
            if (!(get(mouseX, mouseY)==bgc)&&mousePressed) {//(mouseX>line2.get(i)-30&&mouseX<line2.get(i)+30&&mouseY>line2.get(i+1)-30&&mouseY<line2.get(i+1)+30)||(mouseX>line.get(i)-30&&mouseX<line.get(i)+30&&mouseY>line.get(i+1)-30&&mouseY<line.get(i+1)+30))
              println(get(mouseX, mouseY));
            } else {
              println(get(mouseX, mouseY));
            }
            // lineColor.set(i, hex(color(255, 0)));


            //set to bgc before it changes
            //lineColor.set(i, hex(color(255, 100*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)))));
          }
        }

        //erase glitch glitchLines
        for (int i = 0; i<glitchLines2.size()-1; i++) {
          if (i%2==1) {
            //i have no idea why this works
          } else {
            // if ((mouseX>glitchLines2.get(i)-30&&mouseX<glitchLines2.get(i)+30&&mouseY>glitchLines2.get(i+1)-30&&mouseY<glitchLines2.get(i+1)+30)||(mouseX>glitchLines.get(i)-30&&mouseX<glitchLines.get(i)+30&&mouseY>glitchLines.get(i+1)-30&&mouseY<glitchLines.get(i+1)+30))
            glitchColor.set(i, hex(color(255, 0)));

            //set to bgc before it changes
            //lineColor.set(i, hex(color(255, 100*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)))));
          }
        }
      }
    }

    //displaying drawn things

    //glitch glitchLines
    strokeWeight(1);
    for (int i = 0; i<glitchLines2.size()-1; i++) {
      if (i%2==1) {
        //i have no idea why this works
      } else {
        stroke(unhex(glitchColor.get(i)));
        line(glitchLines.get(i), glitchLines.get((i+1)), glitchLines2.get(i), glitchLines2.get((i+1)));
      }
    }

    //normal Lines
    for (int i = 0; i<line.size()-1; i++) {
      if (i%2==1) {
        //i have no idea why this works
      } else {
        strokeWeight(lineSize.get(i));
        stroke(unhex(lineColor.get(i)));
        line(line.get(i).x, line.get(i).y, line.get(i+1).x, line.get(i+1).y);
      }
    }
  }

  void erase() {
    line.clear();
    glitchLines.clear();
    glitchLines2.clear();
    glitchColor.clear();
    lineColor.clear();
    lineSize.clear();
  }

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

  void glitch(color x) {
    glitchColor.append(hex(x));
    glitchColor.append(hex(x));
    glitchLines2.append(mouseX);
    glitchLines2.append(mouseY);
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
}
