PFont font;
//code runs at start
void setup(){
  size(500,800);
  font = loadFont("ZapfDingbatsITC-48.vlw");
}
//code runs every frame
void draw(){
  //set background to black
  background(0);
  fill(255);
  stroke(245);
  line(250,0,250,900);
  for (int i = 0; i <20*39;i+= 53){
    float a = -209;
  rect(335+ a,753-i,17,39);
 
  }
 for (int i = 0; i <20*39;i+= 53){
    float a = 40;
  rect(335+ a,753-i,17,39);
  }
}
