//code runs when mouse is clicked
void mouseClicked() {
  //activate clicking events on buttons and selectors
  cs.changeColor();
  ss.changeColor();
  erase.activate();
  eraser.activate();
  normal.activate();
  glitch.activate();
  glitch2.activate();
  rectangle.activate();
  ellipse.activate();
  WD.activate();
  tangent.activate();
  sine.activate();
  vsine.activate();
  vtangent.activate();
  save.activate();
  reset.activate();
  //menu buttons
  slant.activate();
  col.activate();
  customCol.activate();
  hide.activate();
  //secret button
  if (collision(secret, secretw, secreth)) {
    if(secretPlayed==false){
     secr.play(); 
    }
    secretPlayed = true;
    menu=!menu;
  }
}
//code runs when mouse is dragged
void mouseDragged() {
  //draw only when dragged for glitch
  if (p.mode=="glitch"&&stop==false) {
    p.draw = true;
  }
  //if selectors are selected and dragged
  if (cs.selected==true) {
    cs.dragging = true;
  }
  if (ss.selected==true) {
    ss.dragging = true;
  }
  //if mode requires adjustments
  if ((p.mode=="sine"||p.mode=="tangent"||p.mode=="rect"||p.mode=="ellipse"||p.mode=="v.sine"||p.mode=="v.tan")&&stop==false) {
    adjust=true;
  }
}
//code runs when mouse is pressed
void mousePressed() {
  if (!(p.mode=="glitch")&&stop==false) {
    p.draw = true;
  }
}
//code runs when mouse is released
void mouseReleased() {
  if (p.mode=="normal"||p.mode=="eraser"||p.mode=="glitch"&&stop==false) {
    p.undo();
  }
  //releasing rectangle
  if (p.mode=="rect"&&stop==false) {
    plot.stop();
    plot.play(random(0.8, 1.3));
    p.rectangle(c, s, sinePos, wide, high);
  }
  //releasing ellipse
  if (p.mode=="ellipse"&&stop==false) {
    eplot.stop();
    eplot.play(random(0.8, 1.3));
    p.ell(c, s, sinePos, wide, high);
  }
  //releasing sine waves
  if ((p.mode=="sine"||p.mode=="tangent")&&stop==false) {
    if (!trigPlot.isPlaying()) {
      trigPlot.play(random(0.8, 1.3));
    } else {
      trigPlot.stop();
      trigPlot.play(random(0.8, 1.3));
    }
    p.trig(c, s, sinePos, amplitude, lengthOfSine, trigSpace.value, sineOffset);
  } else if ((p.mode=="sine"||p.mode=="tangent")&&pass==true&&saving==false) {
    //let you release if colliding on the right most border
    if (!trigPlot.isPlaying()) {
      trigPlot.play(random(0.8, 1.3));
    } else {
      trigPlot.stop();
      trigPlot.play(random(0.8, 1.3));
    }
    p.trig(c, s, sinePos, amplitude, lengthOfSine, trigSpace.value, sineOffset);
  }

  if ((p.mode=="v.sine"||p.mode=="v.tan")&&stop==false) {
    if (!trigPlot.isPlaying()) {
      trigPlot.play(random(0.8, 1.3));
    } else {
      trigPlot.stop();
      trigPlot.play(random(0.8, 1.3));
    }
    p.vtrig(c, s, sinePos, amplitude, lengthOfSine, trigSpace.value, sineOffset);
  } else if ((p.mode=="v.sine"||p.mode=="v.tan")&&pass2==true) {
    if (!trigPlot.isPlaying()) {
      trigPlot.play(random(0.8, 1.3));
    } else {
      trigPlot.stop();
      trigPlot.play(random(0.8, 1.3));
    }
    //let you release if colliding on the bottom border
    p.vtrig(c, s, sinePos, amplitude, lengthOfSine, trigSpace.value, sineOffset);
  }
  //placing wingdings
  if (p.mode=="WD"&&stop==false) {
    plot.stop();
    plot.play(random(0.8, 1.3));

    p.wd(c, map(s, sizeRange1.value, sizeRange2.value, sizeRange1.value*10, sizeRange2.value*2), sel);
  }
  drawing.stop();
  glitching.stop();
  //stop adjusting
  adjust=false;
  //make everything false
  stop = false;
  p.draw = false;
  p.fix();
  cs.dragging = false;
  ss.dragging = false;
}
//code runs when key is pressed
void keyPressed() {
  //allow hex code to be typed
  for (int i = 0; i<bgc1.length; i++) {
    keyHandler(bgc1[i]);
  }
  //allow numbers to be typed
  numberTyping(lerpSpeed);
  numberTyping(trigSpace);
  numberTyping(trigAmp1);
  numberTyping(trigAmp2);
  numberTyping(sizeRange1);
  numberTyping(sizeRange2);
  numberTyping(colorRange1);
  numberTyping(colorRange2);
  numberTyping(csSpeed);
  numberTyping(ssSpeed);
  textTyping(wd);
  //undo on z
  if (key =='z'||key=='Z'&&menu==false) {
    p.undo();
  }
  //redo on y
  if (key =='y'||key=='Y'&&menu==false) {
    p.redo();
  }
  //no mode
  if (key =='h'||key=='H'&&menu==false) {
    p.mode="";
  }
}
