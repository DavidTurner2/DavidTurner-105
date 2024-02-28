//add comments
void setup() {
  size(999, 999);
}
float r = random(255);
float g = random(255);
float b = random(255);
float bgr = random(100);
float bgg = random(100);
float bgb = random(100);
PVector secret = new PVector(800, 250);
FloatList killers = new FloatList();
float appear = 255;
int press = 0;
int press2 = 0;
boolean stop = false;
boolean died = false;
String alive = "secrets found: ";
String tutorial = "\nclick to change text color";
void draw() {
  background(bgr, bgg, bgb);
  fill(#ffffff);
  text(alive + press+tutorial, 10, 20);
  if (died == false) {
    windowResize(199+mouseX, 199+mouseY);
  }


  println();
  fill(r, g, b, appear);
  if (frameCount%10 == 0) {
  }

if(press<100){
  appear--;
}

  text("secret", secret.x, secret.y);


  for (int i =10; i<=1000; i+=10) {
    if (press2 == i) {
      killers.append(0);
      killers.append(0);
      press2++;
    }
  }



  for (int i = 0; i<killers.size()-1; i++) {
    fill(r, g, b, appear);
    text("end this game", killers.get(i)-10, killers.get(i+1));
  }

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


  if (frameCount%int(random(69, 200)) == 0) {
    float x = random(20, 800);
    float y = random(10, 800);
    if (y > mouseY -10 && y < mouseY+10) {
      y-=30;
    }
    secret.x = x;
    secret.y = y;
  }

  for (int i = 0; i<killers.size()-1; i++) {

    if (press<100) {
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

  if (appear < 0) {


    appear = random(130, 255);
  }
}
void mousePressed() {
  if (died == false) {
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if(press>99){
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
