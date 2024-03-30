PFont font;
//gloabal string array
String[] rng;
boolean e = false;

void setup() {
  //set size of array to 44
  rng = new String[44];
  font = loadFont("Wingdings-Regular-48.vlw");
  for (int i = 0; i<44; i++) {
    rng[i] = change2(int(random(60)));
  }
}
void settings() {
  size(displayWidth, displayHeight);
}

boolean yuh = true;
float s = 0;
float step = 0;
float sstep;
void draw() {

  if (second()%2==0) {
    for (int i = 1; i<44; i++) {
      rng[i] = "||";
      e = true;
    }
    rng[0] = change2(minute());
    sstep+=0.008;
    // sstep += 0.051;
  } else {
    e=false;
    for (int i = 0; i<44; i++) {
      if (frameCount%2==0) {
        rng[i] = change2(int(random(60)));
      }
    }
    sstep += 0.051;
  }

  step +=0.500;
  //set background to a color
  background(0);
  //whenever i push
  pushMatrix();
  //no fill white circle in centerred to the screen translate oposite way as the window moves
  noFill();
  stroke(255);
  strokeWeight(6);
  translate(-(int(displayWidth*0.325)+int((displayWidth*0.15)*sin(sstep))), -(int(displayHeight*0.325)+int((displayHeight*0.25)*cos(sstep))));
  circle(displayWidth/2.25, displayHeight/2, displayHeight/1.7);
  if(hour()%3==0){
  //white lines roating in center of circle
  strokeWeight(10);
  translate(displayWidth/2.25, displayHeight/2);
  stroke(255);
  scale(0.2);
  for (int i = 0; i<70; i++) {
    rotate(0.1);
    line(displayWidth/2*(sin(frameCount/23.009)), displayHeight/4+i*0.3, displayWidth/3, displayHeight/1.5*cos(i*sin(frameCount/99.009))+100+i+i*0.3);
  }
  
  translate(width/1.45, height/1.5);
  }else{
      translate(displayWidth/2.25, displayHeight/2);

    scale(0.4);
  translate(width/1.45, height/1.5);

  
  
    pushMatrix();
    translate(width/-4, height*-1.5);
    scale(0.02);
    strokeWeight(100);
    rotate(step/10.01919);
    for (int j = 0; j<11; j++) {
      rotate(step/100.01919);
      pushMatrix();
      //rotating random spiralling thing
      for (int i = 0; i<29; i++) {
        //change stroke based on for loop
        stroke(200+i*2, 200+i*2, 100, 255);
        line(sin(j*10)+width/0.48, height/0.27, j*20+width/1.44+i*2.5, height/9.91);
        //extra line at slightl;y differnt
        stroke(i*6, i*9, 18, 260);
        line(sin(j*20)+width/2.00, height/2.00, j*20+width/2.00+i*2.5, height/1.19);
        // translate(118*cos(step/59.7130), 43*sin(step/40.8791));
        translate(width*10, -height);
      }
      popMatrix();
    }
     popMatrix();
  
  }  
  
  
  if (hour()%2==0) {
    scale(4);
    pushMatrix();
    strokeWeight(1);
    for (int i = 0; i<70; i++) {
      stroke(255, i*2, i*3);

      rotate(frameCount/99.009);
      line(width/3*(sin(frameCount/23.009)), height/4+i*0.3, width/2, height/1.5*tan(i*sin(frameCount/99.009))+i+i*0.3);
    }
    popMatrix();
    rotate(-sstep);
    popMatrix();
  } else {    
   scale(4);  
  stroke(200+100*sin(step/99.023), 100+sin(step/4), 100);
  noFill();
  pushMatrix();
  for (int i = 0; i<20; i++) {
    translate(width/2*sin(step/99.009), height/2*sin(step/99.009));
    rotate((step/299.00923));
    strokeWeight(i);
    arc(i+width/2, height/4, width/8, height/8, 0, 10*abs(sin(step/23.234)));
  }
  popMatrix();
  for (int i = 0; i<34; i++) {
    translate(width/2*sin(step/99.009), height/2*sin(step/99.009));
    rotate(-(step/199.00923));
    strokeWeight(i);
    arc(i+width/2, height/4, width/8, height/8, 0, 10*abs(sin(step/23.234)));
  }
        
    
    
    
    
  
     popMatrix();
  }  
  
      pushMatrix();
  stroke(10, 150, 100);
  noFill();
  strokeWeight(50);
  translate(width/2, height/2);
  rotate(step/8);
  translate(-width/2, -height/2);
  strokeWeight(1);
  for (int j = 0; j<20; j++) {
    for (int i = 0; i<4; i++) {
      curve(j*10+i*20+width/3.61*cos(step/20), height/1.29*sin(step/14.8),
        width/2.00, j*100+height/1.28*sin(step/40),
        width/1.00*cos(step/14.8), height/2.00,
        width/1.00*sin(step/32), height/6.16);
    }
  }
 popMatrix();
  

   //text rotating
  translate(-(int(displayWidth*0.325)+int((displayWidth*0.15)*sin(sstep))), -(int(displayHeight*0.325)+int((displayHeight*0.25)*cos(sstep))));
  fill(255);
  textSize(100);
  text(change(hour())+":", (displayWidth/2.35+(displayWidth/10.05)*cos(step/16)), (displayHeight/2.0)+(displayHeight/4.8)*sin(step/16));
  textSize(50);
  for (int i = 0; i<44; i++) {
    fill(255);
    if (e) {
     // if(i==0){
      // fill(255,100+constrain(second()*3,0,155),constrain(second()*6,0,255)); 
     // }
      text(rng[i], (displayWidth/2.30)+(displayHeight/4.1)*sin(sstep+i), (displayHeight/2)+(displayHeight/3.8)*cos(sstep+i));
    } else {
      text(rng[i], (displayWidth/2.30)+(displayHeight/4.1)*sin(i), (displayHeight/2)+(displayHeight/3.8)*cos(i));
    }
    // text(change2(minute()),(displayWidth/2.30)+(displayHeight/4.1)*sin(sstep+i), (displayHeight/2)+(displayHeight/3.8)*cos(sstep+i));

    // text("25",(displayWidth/2.30)+(displayHeight/4.1)*cos(i), (displayHeight/2)+(displayHeight/3.8)*sin(i));
  }



  windowResize(displayWidth/5, displayHeight/3);
  windowMove(int(displayWidth*0.325)+int((displayWidth*0.15)*sin(sstep)), int(displayHeight*0.325)+int((displayHeight*0.25)*cos(sstep)));
}
//change hour to am/pm hour time
int change(int h) {
  if (h == 0) {
    return 12;
  } else if (h>12) {
    return h - 12;
  } else {
    return h;
  }
}
//change minutes and second to have a zero infront of a single digit
String change2(int h) {
  if (h<10) {
    return "0"+h;
  } else {
    return (""+h);
  }
}
