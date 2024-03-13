//code runs at start
void setup() {
  size(999, 999); // set size to 999,999
}
//random rgb values
float r = random(255);
float g = random(255);
float b = random(255);
//random background rbg values
float bgr = random(100);
float bgg = random(100);
float bgb = random(100);
//pvector for secret
PVector secret = new PVector(800, 250);
//pvector for killers
FloatList killers = new FloatList();
//appear
float appear = 255;
//counts how many times you collected a secret
int press = 0;
//temporary variable that introduces the killers
int press2 = 0;
//stop looping indefinetly
boolean stop = false;
//if you are alive
boolean died = false;
//text that will change when you die
String alive = "secrets found: ";
String tutorial = "\nclick to change text color";

//code runs everyframe
void draw() {
  //set background to random background variables
  background(bgr, bgg, bgb);
  //fill the text white
  fill(#ffffff);
  //display alive and tutorial text
  text(alive + press+tutorial, 10, 20);
  //if your not dead change the windows size based on mouse
  if (died == false) {
    //add 199 to make it easier to change window size
    windowResize(199+mouseX, 199+mouseY);
  }

  //fill with random r and g and b
  fill(r, g, b, appear);
  if (frameCount%10 == 0) {
  }
//if press is less than 100 then make things appear
if(press<100){
  appear--;
}
//secret text you need to collect
  text("secret", secret.x, secret.y);

//start adding killers every time you collect 10 killers
  for (int i =10; i<=1000; i+=10) {
    if (press2 == i) {
      killers.append(0);
      killers.append(0);
      press2++;
    }
  }


//if you collect killer you die
  for (int i = 0; i<killers.size()-1; i++) {
    fill(r, g, b, appear);
    text("end this game", killers.get(i)-10, killers.get(i+1));
  }
//when you collect a secret 
  if (died == false && mouseX > secret.x - 10 && mouseX < secret.x + 50 && mouseY > secret.y - 10 && mouseY < secret.y + 10) {
    println(mouseX, " ", mouseY);
    r = random(255);
    g = random(255);
    b = random(255);
    bgr = random(255);
    bgg = random(255);
    bgb = random(255);
    secret.x = random(20, 800);
    secret.y = random(10, 800);
    press++;
    press2=press;
  }

//make secret appear randomoly
  if (frameCount%int(random(69, 200)) == 0) {
    float x = random(20, 800);
    float y = random(10, 800);
    //make sure it doesnt spawn where you are
    if (y > mouseY -10 && y < mouseY+10) {
      y-=30;
    }
    //assign new position for secret
    secret.x = x;
    secret.y = y;
  }

//make killers appear randomoly
  for (int i = 0; i<killers.size()-1; i++) {
    //if press is less than 100  make sure killers dont spawn where you are
    if (press<100) {
      //make it consistlnty at this speed appear frameCount is divisible by 200
      if (frameCount%200 ==0) {
        float x = random(20, 800);
        float y = random(10, 800);
        if (y < mouseY +10 && y > mouseY-10) {
          y-=60;
        }
        killers.set(i+1, y);
        killers.set(i, x);
      }
    }
    //killers no longer try to kill you when you reach 100 secrets
    if (press>=100) {

      if (stop == false) {
        for (int j = 0; j<7000; j++) {
          killers.append(0);
          killers.append(0);
          stop = true;
        }
      }if(frameCount%50==0){
      float x = random(20, 800);
            killers.set(i, x);
      }
      
      float y = random(10, 800);
      if (y < mouseY +10 && y > mouseY-10) {
        y-=30;
      }
      killers.set(i+1, y);
      
    }

//end the game when you hover over a killer
    if (mouseX > killers.get(i) +10 && mouseX < killers.get(i) + 50 && mouseY > killers.get(i + 1) - 10 && mouseY < killers.get(i+1) + 10) {
      println(mouseX, "killed", mouseY);
      bgr = 0;
      bgg = 0;
      bgb = 0;
      r = 0;
      g = 0;
      b = 0;
      died = true;
      windowResize(400, 300);
      tutorial="";
      alive = "Game ended. final score: ";
    }
  }

//set appearing to random transprency
  if (appear < 0) {
    appear = random(130, 255);
  }
}
void mousePressed() {
  //change text color when clicked
  if (died == false) {
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if(press>99){
    //only change background color on right
    if(mouseX > 800){
    bgr = random(255);
    bgg = random(255);
    bgb = random(255);
    }
    else{
    r = random(255);
    g = random(255);
    b = random(255);
    }
  }
}
