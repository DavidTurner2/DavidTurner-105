//set global variable font
PFont font;
//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
  //assign font to font loaded from data folder
  font = loadFont("VCROSDMono-48.vlw");

  //set stroke weight to 2
  strokeWeight(2);
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
//step value for animating start at random position
float step = int(random(7));
float move;
//code runs every frame
void draw() {
  //check if current year is leap year
  leap = ((year() % 400 == 0) ||(year() % 100 > 1) && (year() % 4 == 0)) ? true:false;
  //set future day
  futureDay = day()+1;
  futureMonth = month()+1;
  //increment step value
  step += 0.012;
  //set background to grey
  background(230);
  //make black rectangles
  fill(0);
  rect(108, 208, 565, 39);
  rect(0, 460, 900, 200);
  pushMatrix();
  //change movement values
  if (mouseX<150 && (mouseY>460&&mouseY<660)) {
    //dont move if it goes out of bounds
    if (move+(-40*total(day()))<-40) {
      move+=7.232;
    }
  } else if (mouseX>650 && (mouseY>460&&mouseY<660)) {
    //dont move if it goes out of bounds
    if (move+(-40*total(day()))>-14640) {
      move-=7.232;
    }
  }
  //move map using mouse starting position depends on current day out of the year
  translate(-40*total(day())+move, 0);
  //strips
  fill(255, 0, 0);
  rect(80, 550, 14620, 20, 10);
  fill(0, 180, 40);
  rect(80, 570, 14620, 20, 10);
  fill(0);
  //variable to move the quad to febreary 29th
  float mov = 2170;
  //regular year not going to februaray 29th
  quad(264+mov, 570, 303+mov, 571, 289+mov, 586, 252+mov, 586);
  //make font size smaller
  textFont(font, 13);
  //days
  for (int i = 1; i<367; i++) {
    pushMatrix();
    //grey for days youve already passed
    if (i<=total(day())) {
      fill(60);
      //flash when you just arrived at a new day
      if (i == total(day())) {
        if (hour()==0) {
          fill(lerpColor(#ff9900, #3c3c3c, norm(1/sin(frameCount/16.009), -1, 1)));
        }
      }
    } else {
      //make future days orange
      fill(255, 140, 0);
      //if its not a leap year make the day grey as its going to be skipped
      if (i == 60&&leap==false) {
        fill(60);
      }
    }
    //circles for days
    circle(50+i*40, 570, 15);
    //rotate the days
    translate(50+i*40, 570);
    fill(255);
    rotate(-0.8);
    //display days using i value to find out what month the day belongs to
    if (i>0&&i<=31) {
      text("January "+i, 19, -11);
    } else if (i>31&&i<=60) {
      text("February "+(i-31), 19, -11);
    } else if (i>60&&i<=91) {
      text("March "+(i-60), 19, -11);
    } else if (i>91&&i<=121) {
      text("April "+(i-91), 19, -11);
    } else if (i>121&&i<=152) {
      text("May "+(i-121), 19, -11);
    } else if (i>152&&i<=182) {
      text("June "+(i-152), 19, -11);
    } else if (i>182&&i<=213) {
      text("July "+(i-182), 19, -11);
    } else if (i>213&&i<=244) {
      text("August "+(i-213), 19, -11);
    } else if (i>244&&i<=274) {
      text("September "+(i-244), 19, -11);
    } else if (i>274&&i<=305) {
      text("October "+(i-274), 19, -11);
    } else if (i>305&&i<=335) {
      text("November "+(i-305), 19, -11);
    } else if (i>335) {
      text("December "+(i-335), 19, -11);
    }
    popMatrix();
  }

  popMatrix();
  //set textfont to the font i loded with size 30
  textFont(font, 30);
  //put the year text in parenthesis
  if (leap) {
    fill(255, 0, 0);
  } else {
    fill(0, 180, 40);
  }
  text("("+year()+")", 111, 242);

  fill(255, 0, 0);

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
      text(currentHour+":"+currentMinute, 380, 242);
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
      text(currentHour+":"+currentMinute, 380, 242);
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
    if (hour()<12) {
      currentMinute = change2(minute())+" AM";
    } else {
      currentMinute = change2(minute())+" PM";
    }
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
//takes day and returns different value based on the month should be the total out of 366
int total(int h) {
  if (month()==1) {
    return h;
  } else if (month() == 2) {
    return h + 31 ;
  } else if (month()==3) {
    return h +60 ;
  } else if (month()==4) {
    return h +91;
  } else if (month()==5) {
    return h +121;
  } else if (month()==6) {
    return h +152;
  } else if (month()==7) {
    return h +182;
  } else if (month()==8) {
    return h +213;
  } else if (month()==9) {
    return h +244;
  } else if (month()==10) {
    return h +274;
  } else if (month()==11) {
    return h +305;
  } else if (month()==12) {
    return h +335;
  } else {
    return h;
  }
}
