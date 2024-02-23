void setup(){
 size(700,700);
 background(0);
}

color[] w = {255,123,255,123,123,50,255,67};

void draw(){
  strokeCap(PROJECT);
     if(frameCount%3==0){
         strokeWeight(30);
        float y =  random(700);
  for (int i = 0; i<60;i++){
   
    stroke(lerpColor(w[int(random(w.length-1))],w[int(random(w.length-1))],w[int(random(w.length-1))]),#ff0000,random(255),i);
    point(random(-100,700) + i,y);
  }
     }
     translate(350,350);
     scale(0.50);
  for(int i = 0; i<134; i++){
  stroke(0,0,random(200,236),random(150,206));
  strokeWeight(random(5));
  rotate(frameCount/99);
  line(random(200) * cos(frameCount),99*tan(frameCount),random(200) * cos(frameCount),99*tan(frameCount));
  }
}
