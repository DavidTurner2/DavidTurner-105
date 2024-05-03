void setup() {
  size(800, 800);
}

void draw() {
  background(0);

  rect(100, 400, 400, 100);
  rect(100, 400, 400, 100);

  square(123, 300, 10);
  square(123, 300, 10);
  square(123, 300, 10);
  text("- [] X", 100, 100);
  
  translate(300,0);
  rect(100, 400, 400, 100);
  rect(100, 400, 400, 100);

  circle(123, 300, 5);
  circle(123, 300, 5);
  circle(123, 300, 5);
  text("X - <>", 100, 100);
  
  
}
