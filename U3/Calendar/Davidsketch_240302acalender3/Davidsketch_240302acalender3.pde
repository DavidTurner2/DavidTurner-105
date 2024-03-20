//set global variable font
PFont font;
//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
  //assign font to font loaded from data folder
  font = loadFont("VCROSDMono-48.vlw");
  //set textfont to the font i loded with size 30
  textFont(font, 30);
  //turn off stroke
  noStroke();
}
//variable for looping through a time frame
int loop;
//future day variable to display on string
int futureDay;
int futureMonth;

//varriable for saving current minute
int currentHour;
//string variable for minutes its a stirng because i want to display it as 01 02 03 etc
String currentMinute;
//step value for animating
float step = 0;
//code runs every frame
void draw() {
  //set future day
  futureDay = day()+1;
    futureMonth = month()+1;

  //increment step value
  step += 0.01;
  //set background to grey
  background(230);
  //make black rectangle
  fill(0);
  rect(100, 200, 600, 75);
  //put the year text in parenthesis
  fill(255, 0, 0);
  text("("+year()+")", 109, 242);
  //make flashing text 
  if((day() <31) && month() == 1 || month() == 3||month() == 5||month() == 7||month() == 8||month() == 10||month() == 12){
  if (loop == 1) {
    text("DECEMEBER "+"31"+" BOUND YEAR", 250, 242);
  } 
  if (loop == 3) {
    text("THE NEXT DAY IS", 300, 242);
  } 
  if (loop == 5) {
    text(monthName(month())+" "+futureDay, 320, 242);
  } 
    if (loop == 7) {
    text(currentHour+":"+currentMinute, 400, 242);
  } 
 }
 else if(month()==2&&day()==28){
     if (loop == 1) {
    text("DECEMEBER "+"31"+" BOUND YEAR", 250, 242);
  } 
  if (loop == 3) {
    text("THE NEXT DAY IS", 300, 242);
  } 
  if (loop == 5) {
    text(monthName(futureMonth)+" "+futureDay, 320, 242);
  } 
    if (loop == 7) {
    text(currentHour+":"+currentMinute, 400, 242);
  } 
 }
 else if (day() == 30){
   
 }

//change value of loop based on step variable to make different things happen
  if (step > 1 && step < 2) {
    loop = 1;
  }
  if (step > 2 && step < 3) {
    loop = 2;
  }
  if (step > 3 && step < 4) {
    loop = 3;
  }
  if (step > 4 && step < 5) {
    loop = 4;
  }
  if (step > 5 && step < 6) {
    loop = 5;
  }
  if (step > 6 && step < 7) {
    loop = 6;
    //set the time now so that it doesnt change while its displaying
    currentHour = change(hour());
    currentMinute = change2(minute());
  }
  if (step > 7 && step < 8) {
    loop = 7;
  }
  //restart the step to 0 to go over the loop
  if (step > 8 && step < 9) {
    loop = 8;
    step = 0;
  }
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

//CHANGE MONTH INTEGER INTO STRING OF THE NAME OF THE MONTH
String monthName(int m){
  return m==12 ? "DECEMEBER" : m==1 ? "JANUARY" : m==2 ? "FEBRUARY" : m==3 ? "MARCH" : m==4 ? "APRIL" : m==5 ? "MAY" : m==6 ? "JUNE" : m==7 ? "JULY" : m==8 ? "AUGUST" : m==9 ? "SEPTEMEBER" : m==10 ? "OCTOBER" : m==11 ? "NOVEMEBER" : "JANURARY";
}
