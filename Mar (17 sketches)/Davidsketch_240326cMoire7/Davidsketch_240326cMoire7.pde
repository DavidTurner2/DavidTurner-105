//code runs at statr
void setup(){
  //set size to 800,800
  size(800,800);
}
//code runs everyframe
void draw(){
  //set background to dark bluegreen
  background(0,40,20);
  //set stroke to white tinted blue a lil
  stroke(233,233,255);
  strokeWeight(0.3);
  //linezzz
  //do the strange thing
  for(int i = 0; i<500; i++){
  line(0-10,100+i+i*0.3,800,100+i*0.6+i+i);
  }
   rotate(0.05);
   translate(0,110);
    for(int i = 0; i<500; i++){
  line(400*(sin(frameCount/23.009)),100+i*0.3,600,900*tan(50+0.0009*sin(frameCount/99.009))+100+i+i*0.3);
  }
     translate(200,0);
   for(int i = 0; i<500; i++){
  line(400*(cos(frameCount/23.009)),100+i*0.3,600,100+sin(i)*0.3);
  }
    //use this later line(400*(sin(frameCount/23.009)),100+i*0.3,600,900*cos(i*sin(frameCount/99.009))+100+i+i*0.3);

}
