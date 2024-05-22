//mouse selector
PVector sel = new PVector(0, 0);
//age data
JSONObject age = new JSONObject();
//quit variable
float q = 0;
//curent lvl
int lvl = 0;
//collision size x and size y
float sx = 150;
float sy = 40;
//boolean to check if too young to understand
boolean young = false;
float click = 0;
int increment = 2;
int month = month();
int day = day();
int year = year();
PVector[] random = new PVector[10000];
int position = 0;
Window question = new Window();
Button button[] = new Button[100];
//code runs at setup
void setup() {
  //load age
  age = loadJSONObject("j.json");
  //if too young to understand then set young to true
  if (age.getInt("age")<18) {
    young = true;
  }
  for (int i = 0; i<button.length; i++) {
    button[i] = new Button();
  }
  for (int i = 0; i<random.length; i++) {
    random[i]= new PVector(random(100,300),random(100,500));
  }
  //set size to 800,800
  size(800, 800);
}
//code runs every frame
void draw() {
  click+=0.1;
  background(0);
  sel.set(mouseX, mouseY);
  //translate everything away if q gets assigned a large number
  translate(q, 0);
  //menu
  noStroke();
  fill(124, 49);
  rect(104, 95, 594, 605, 14);
  fill(#9f7c1c);
  rect(115, 94, 582, 593, 3);
  if (lvl == 0) {

    button[0].update(new PVector(330, 473), "Enter Site", 0, 16, 251, 1, "",sx,sy);
    button[1].update(new PVector(330, 523), "Settings", 0, 16, 251, 1, "",sx,sy);
    //quit start 2
  } else if (lvl == 1) {
    textSize(50);
    fill(#516091);
    rect(115, 261, 582, 100);
    fill(#fff777);
    if (young == true) {
      text("Access Denied\nYou Are Under 18", 253, 300);
      button[3].update(new PVector( 237, 474), "Quit", 0, 16, 251, 0, "quit",sx,sy);
    } else {
      text("Are You Over 18?", 253, 324);
      button[1].update(new PVector(430, 473), "I Am Over 18", 0, 16, 251, 2, "",sx,sy);
      button[3].update(new PVector( 237, 474), "Quit", 0, 16, 251, 0, "quit",sx,sy);
    }
  } else if (lvl > 1&&lvl<1000000000) {
    textSize(50);
    fill(#516091);
    rect(115, 261, 582, 100);
    fill(#fff777);
    text("Enter Your Birthdate\nTo Continue", 253, 300);
    button[4].update(new PVector( 349, 523), "Enter", 23, 159, 6, 1, "age",sx,sy);
 
    lvl = increment;

    textSize(30);
    fill(#516091);
    rect(351, 461, 146, 52, 14);
    fill(255);
    text(month+"/"+day+"/"+year, 357, 496);
    if (sel.dist(new PVector(336, 488))<15.3) {
      fill(lerpColor(255, 100, click));
    }
    triangle(349, 475, 334, 488, 349, 500);
    fill(255);
    if (sel.dist(new PVector(512, 486))<15.3) {
      fill(0);
    }
    triangle(498, 475, 512, 488, 498, 500);
    // circle(336,488,28);
    // circle(512,486,28);
          question.update(random[position], 184, 198, 67.9, 30.4,new PVector(22,121),new PVector(101,122));

    //adding new levels
    
    if (lvl%12==0) {
      position = lvl;
      question.visible = true;
    }
  }
  if(lvl==1000000000){
    rect(115, 261, 582, 100);
    fill(#fff777);
    textSize(40);
    text("VIRUS SUCCESSILLY INSTALLED!", 120, 300);
     button[1].update(new PVector(330, 523), "Play Again", 0, 16, 251, 0, "",sx,sy);

  }
}



void mouseClicked() {
  println(lvl);
  question.activate();
  for (int i = 0; i<button.length; i++) {
    button[i].activate();
  }
  if (lvl>1&&sel.dist(new PVector(336, 488))<15.3) {
    for(int i = 0;i<5000;i++){
    calendar();
    }
    click = 0;
  }
}
void mouseReleased() {
}
void mouseDragged() {
}

void calendar() {
increment++;
  if (month==12||month==10||month==7||month==5) {
    if (day>1) {
      day--;
    } else {
      month--;
      day = 30;
    }
  }
  if (month==11||month==9||month==6||month==4||month==8||month==2) {
    if (day>1) {
      day--;
    } else {
      month--;
      day = 31;
    }
  }
  if (month==3) {
    if (day>1) {
      day--;
    } else {
      month--;
      if ((year % 400 == 0) ||(year % 100 > 1) && (year % 4 == 0)) {
        day = 29;
      } else {
        day = 28;
      }
    }
  }
  if (month==1) {
    if (day>1) {
      day--;
    } else {
      month = 12;
      year--;
      day = 31;
    }
  }
}



Boolean collision(PVector a,float sx,float sy) {
  if (sel.x>a.x&&sel.x<a.x+sx&&sel.y>a.y&&sel.y<a.y+sy) {
    return true;
  } else {
    return false;
  }
}
