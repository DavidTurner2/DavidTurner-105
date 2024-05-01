//code runs at start
void setup() {
  //set size to 800,800 render in p3d
  size(800, 800, P3D);
}
//code runs every frame
void draw() {
  //set background to light blue
  background(#aabbff);
  //who turned on the lights
  lights();
  //translate to here
  translate(378, 377);

  //rotating hoop
  for (int i = 1; i<268; i++) {
    PVector d =new PVector(-91, 140);
    fill(i*4.3);
    d.add(254.2*cos(0.93+-1.00*i), 244.7*sin(frameCount*0.009+0.86+i*-1.00), 100*(sin(frameCount/99.0009)));
    text("Destroy It", d.x, d.y, d.z);
  }

  //tornado
  pushMatrix();
  for (int i = 1; i<268; i++) {
    PVector d =new PVector(-91, 0);
    fill(i*4.3);
    d.add(172.8*cos(-2.87*i), 241.8*sin(i*1.62));

    rotateY(frameCount/999.009);
    text("Tornado ", d.x, d.y, -1000*cos(frameCount/999.009));
  }
  popMatrix();

  //weird pattern
  for (int i = 1; i<268; i++) {
    PVector d =new PVector(800, -800);
    fill(i*4.3);
    d.add(172.8*cos(-2.86*i), 241.8*sin(i*1.14));
    text("Destroy It", d.x, d.y+100*tan(frameCount/700.0090), -1500+25*cos(frameCount/9.009));
  }
  //set scale smaller
  scale(0.8);
  
  //blue twisting thing
  for (int i = 1; i<268; i++) {
    PVector a = new PVector(594+i*-1.15, 387+i*0.00);
    fill(18, 0, 160, 200*norm(sin(frameCount/99.009), -1, 1));
    translate(2, -1);
    //a.rotate(0.31*sin(i*0.18));
    a.add(-474, -433);
    a.rotate(frameCount/99.00909+i);
    text("Blueberry", a.x, a.y);
  }
}
