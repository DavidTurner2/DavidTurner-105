//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
}
//variable that controls animation value
float step = 0;
//variable for spiral animation
float sstep = 62;

Boolean backward = false; //boolean that determines which way the variable step incriments

//code runs every frame
void draw() {
  step+=0.100001;

  //set background to black
  background(0);
  //for loop changing junk
  //if sstep is greater than 64 then start  incrementing backwards
  //if sstep is less than or equal to 62 start incrimenting forwards
  if (sstep >= 64) {
    backward = true;
  }
  if (sstep <= 62) {
    backward = false;
  }

  if (backward == true) {
    sstep-=0.0300001;
  }
  //increment up slightly slowly by only incrimenting when framecount is divisible by 2
  if (backward == false) {
    sstep+=0.0300001;
  }

  for (int j = 0; j<3; j++) {

    //for loop for drawing 2 sets of lines that overlap on first line
    for (int i = 0; i<50; i++) {
      //change stroke based on for loop
      stroke(i*2, i*2, 0, 255);
      line(j*20+100+i*3, 800, j*20+0+i*2, 0);
    }
    pushMatrix();
    //rotating random spiralling thing
    for (int i = 0; i<123; i++) {
      //change stroke based on for loop
      stroke(100+i*2, i*2, 0, 150);
      line(j*20+100+i*1, 400, j*20+0+i*0.5, 200);
      //extra line at slightl;y differnt
      stroke(i*2, i*2, 100, 100);
      line(j*19.88+110+i*1.002, 600.78, j*19.99+110+i*0.465, 99.67);

      translate(10*cos(step/2.0002), 100*sin(step/1.0002));
      translate(722, 375);
      rotate(sstep/30.00673);
    }
    //whenever im pushing and popping matrix it makes sure that translations/rotations/scaling from above dont effect code from below
    popMatrix();
    pushMatrix();
    translate(50*sin(step/2.0002), 100*cos(step/2.0002));
    //for loop for drawing lines
    for (int i = 0; i<50; i++) {
      //make red go to light pink from loop
      stroke(abs(500*sin(step)), i*2, i*2);
      line(j*300+0+i*4, 999, j*300+0+i*2, -999);
    }
    popMatrix();
  }
  //blue red thing in the front
  for (int i = 0; i<123; i++) {
    //make go to  blue from step absoulute style
    stroke(0, 0, abs(500*sin(step)), 200);
    //tilting the begin without translte
    line(300*sin(step)+0+i*4, 999, 300+0+i*2, -999);
  }
}
