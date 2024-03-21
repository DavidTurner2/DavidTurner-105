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
//future day month variable to convert to a name
int futureMonth;
//future date to display
String futureDate;
//boolean that determines if year is leap year
boolean leap;
//varriable for saving current minute
int currentHour;
//string variable for minutes its a stirng because i want to display it as 01 02 03 etc
String currentMinute;
//step value for animating
float step = 0;
//code runs every frame
void draw() {
  //set leap year
  leap = ((year() % 400 == 0) ||(year() % 100 > 1) && (year() % 4 == 0)) ? true:false;
  //set future day
  futureDay = day()+1;
  futureMonth = month()+1;
  //increment step value
  step += 0.012;
  //set background to grey
  background(230);
  //make black rectangle
  fill(0);
  rect(108, 208, 565, 39);
  //put the year text in parenthesis
  fill(255, 0, 0);
  text("("+year()+")", 111, 242);
  //conditional stamentments to set the next day based on which months have 31 days or if its a leap year
  if ((day() <31 && month() == 1) ||( day() <31 && month() == 3)||(day() <31 && month() == 5)||(day() <31 && month() == 7)||(day() <31 && month() == 8)||(day() <31 && month() == 10)||(day() <31 && month() == 12)) {
    futureDate = monthName(month())+" "+futureDay;
  } else if (month()==2&&day()==29&&leap==true) {
    futureDate = monthName(futureMonth)+" "+1;
  } else if (leap==true&&day()==28) {
    futureDate = monthName(month())+" "+futureDay;
  } else if ((month()==2&&day()==28&&leap==false) || ((day() ==31))) {
    futureDate = monthName(futureMonth)+" "+1;
  } else if (day()==30) {
    futureDate = monthName(futureMonth)+" "+1;
  } else {
    futureDate = monthName(month())+" "+futureDay;
  }
  //if its the last day
  if (month()==12&&day()==31) {
    if (loop == 1) {
      text("LAST DAY", 320, 242);
    }
    if (loop == 3) {
      text(currentHour+":"+currentMinute, 400, 242);
    }
    if (loop == 5) {
      text("LAST DAY", 320, 242);
    }
    if (loop == 7) {
      text(currentHour+":"+currentMinute, 400, 242);
    }//if its 1 am and not the first day of the year
  } else if (hour()>0 || month()==1&&day()==1) {
    if (loop == 1) {
      text("DECEMEBER 31 BOUND YEAR", 250, 242);
    }
    if (loop == 3) {
      text("THE NEXT DAY IS", 300, 242);
    }
    if (loop == 5) {
      text(futureDate, 320, 242);
    }
    if (loop == 7) {
      text(currentHour+":"+currentMinute, 400, 242);
    }//if its midnight you just arrived to a new day
  } else {
    if (loop == 1) {
      text(monthName(month())+" "+day(), 320, 242);
    }
    if (loop == 3) {
      text("THIS DAY IS", 300, 242);
    }
    if (loop == 5) {
      text(monthName(month())+" "+day(), 320, 242);
    }
    if (loop == 7) {
      text("THIS DAY IS", 300, 242);
    }
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
    //keep loop 5 going for little longer
    //set the time now so that it doesnt change while its displaying
    currentHour = change(hour());
    currentMinute = change2(minute());
  }
  if (step > 7 && step < 8) {
    loop = 6;
  }
  if (step > 8 && step < 9) {
    loop = 7;
  }
  //restart the step to 0 to go over the loop
  if (step > 9 && step < 10) {
    loop = 9;
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

//CHANGE MONTH INTEGER INTO STRING OF THE NAME OF THE MONTH
String monthName(int m) {
  return m==12 ? "DECEMEBER" : m==1 ? "JANUARY" : m==2 ? "FEBRUARY" : m==3 ? "MARCH" : m==4 ? "APRIL" : m==5 ? "MAY" : m==6 ? "JUNE" : m==7 ? "JULY" : m==8 ? "AUGUST" : m==9 ? "SEPTEMEBER" : m==10 ? "OCTOBER" : m==11 ? "NOVEMEBER" : "JANURARY";
}
