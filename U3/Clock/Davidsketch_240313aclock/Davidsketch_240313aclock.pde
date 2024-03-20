//create global font
PFont font;
color bgc = 0;
//code runs at start
void setup() {
  //assign global font to be font loaded from data
  font = loadFont("Wingdings-Regular-48.vlw");
  //set size to 800,800
  size(800, 800);
  //make stroke to pastel yellow
  stroke(#f0f0af);
}
//string arrays that display the seconds on oval
String[] sec = {"12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"};
String[] sec2 = {"24", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"};
String[] sec3 = {"36", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35"};
String[] sec4 = {"48", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47"};
String[] sec5 = {"60", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"};
//positions for time on the oval
PVector[] time = {new PVector(370, 287),
  new PVector(495, 299),
  new PVector(594, 330),
  new PVector(662, 398),
  new PVector(597, 486),
  new PVector(506, 521),
  new PVector(400, 540),
  new PVector(281, 519),
  new PVector(181, 490),
  new PVector(107, 399),
  new PVector(169, 327), //make seconds divisble by 12 go to the top
  new PVector(254, 300), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287), new PVector(370, 287)};

//code runs every frame
void draw() {
  //AM has black background
  if (hour()<12) {
    background(0);
  }
  //PM has purplish background
  if (hour()>=12) {
    background(46, 35, 45);
  }
  //turn off fill
  noFill();
  //draw 2 ovals
  ellipse(400, 400, 450, 200);
  ellipse(400, 400, 700, 300);
  //change fill from blue to pinkish every minute
  fill(100+2*second(), 180, 180);
  //make text font smaller on the oval
  textFont(font, 30);
  //line that points to every second on the oval every second
  line(400, 400, time[changer(second())].x, time[changer(second())].y);
  //make seconds change to different numbers every 12 seconds
  for (int i = 0; i<12; i++) {
    if (second()<=11) {
      text(sec[i], time[i].x, time[i].y);
    }
    if (second()>=12&&second()<24) {
      text(sec2[i], time[i].x, time[i].y);
    }
    if (second()>=24&&second()<36) {
      text(sec3[i], time[i].x, time[i].y);
    }
    if (second()>=36&&second()<48) {
      text(sec4[i], time[i].x, time[i].y);
    }
    if (second()>=48&&second()<60) {
      text(sec5[i], time[i].x, time[i].y);
    }
  }
  //digital time in the center of the oval
  textFont(font, 40);
  text(change(hour())+":"+change2(minute())+":"+change2(second()), 210, 400);
}

//convert hours from 24 hour time to am pm time
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
//make line to go to the vectors in the right positions every second
int changer(int h) {
  if (h>12 && h<24) {
    return h - 12;
  } else if (h>24&& h<36) {
    return h - 24;
  } else if (h>36&& h<48) {
    return h - 36;
  } else if (h>48&& h<60) {
    return h - 48;
  } else if (h>60&& h<2472) {
    return h - 60;
  } else {
    return h;
  }
}
