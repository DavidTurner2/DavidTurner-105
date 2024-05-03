PVector sel = new PVector(0, 0);
PVector start = new PVector(0, 0);
PVector start2 = new PVector(0, 0);
JSONObject age = new JSONObject();

PVector set = new PVector(0, 0);
PVector quit = new PVector(0, 0);
PVector back = new PVector(0, 0);
float hover[] = new float[100];
float amt[] = new float[100];
float step[] = new float[100];
float q = 0;
int lvl = 0;
float sx = 150;
float sy = 40;
Boolean young = false;

void setup() {
  age = loadJSONObject("j.json");
  if (age.getInt("age")<18) {
    young = true;
  }
  for (int i = 0; i<100; i++) {
    hover[i] = 0;
    amt[i] = 0;
    step[i] = 0;
  }
  size(800, 800);
}
void draw() {
  background(0);
  sel.set(mouseX, mouseY);

  start.set(330, 473);
  start2.set(430, 473);
  quit.set(237, 474);
  set.set(330, 523);
  translate(q, 0);
  noStroke();
  fill(124, 49);
  rect(104, 95, 594, 605, 14);
  fill(#9f7c1c);
  rect(115, 94, 582, 593, 3);
  if (lvl == 0) {

    Button(start, "Enter Site", 8, 254, 0, 1);
    Button(set, "Settings", 16, 251, 0, 2);
  } else if (lvl == 1) {
    textSize(50);
    fill(#516091);
    rect(115, 261, 582, 100);
    fill(#fff777);
    if (young == true) {
      quit.set(237, 474);
      text("Access Denied\nYou Are Under 18", 253, 300);
      Button(quit, "Quit", 36, 254, 0, 2);
    } else {
      text("Are You Over 18?", 253, 324);
      Button(start2, "I Am Over 18", 1, #f28f01, 0, 1);
      Button(quit, "No", 36, 254, 0, 2);
    }
  } else if (lvl == 2) {
    textSize(50);
    fill(#516091);
    rect(115, 261, 582, 100);
    fill(#fff777);
    text("Enter Your Birthdate\nTo Continue", 253, 300);
    
  }
}



void mousePressed() {
  if (asdf(start)&&lvl == 0) {
    lvl = 1;
  } else if (asdf(quit)) {
    age.setInt("age", 0);
    saveJSONObject(age, "data/j.json");
    q=99999;
  } else if (asdf(start2)) {
  }
}




Boolean asdf(PVector a) {
  if (sel.x>a.x&&sel.x<a.x+sx&&sel.y>a.y&&sel.y<a.y+sy) {
    return true;
  } else {
    return false;
  }
}

void Button(PVector a, String t, float x, color b, color bc, int k) {
  if (asdf(a)) {
    hover[k] = 4*sin(step[k]/2);
    amt[k] = 0;
    step[k]+=0.1;
    fill(100, 100, 150+100*abs(tan(frameCount/49.009)));
  } else {
    amt[k]+=0.1;
    step[k] = 0;
    hover[k] = lerp(hover[k], 0, constrain(amt[k], 0, 1));
    fill(b);
  }
  pushMatrix();
  textSize(20);
  stroke(0);
  translate(0, hover[k]);
  rect(a.x, a.y, sx, sy+-hover[k]/8, 20);
  fill(bc);
  text(t, a.x+25+x, a.y+27);
  popMatrix();
}
