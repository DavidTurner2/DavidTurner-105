//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
  //turn off fill
  noFill();
}

//code runs every frame
void draw() {
  //set background to white
  background(255);
  //make two overlapping quads looped over and over
  pushMatrix();
  translate(0,50*sin(frameCount/89.0023));
  for(int i = 0; i<120; i++){
    //randomly offset with bouncy middle thing
  quad(400+i*2.12,200+i*2.12,200+i*2.12,200+i*2.12,200+i*1.72,400+i*2.12,400+i*1.62,400+i*2.32);
   quad(400+10+i*1.822,200+13+i*1.822,200+10.23+i*1.822,200+12.012+i*1.822,200+10.23+i,400+9.023+sin(frameCount+i/9999)*5,400+9.13+i,400+i*1.822);
  }
  popMatrix();
  //rotate slightly and make it move up and down translate sine wave frameCount
  rotate(-0.2);
  translate(0,20*sin(frameCount/99.0023));
    for(int i = 0; i<120; i++){
  quad(400+i*2.12,200+i*2.12,200+i*2.12,200+i*2.12,200+i*1.72,400+i*2.12,400+i*1.62,400+i*2.32);
   quad(400+10+i*1.822,200+13+i*1.822,200+10.23+i*1.822,200+12.012+i*1.822,200+10.23+i,400+9.023+sin(frameCount+i/9999)*5,400+9.13+i,400+i*1.822);
  }
}
