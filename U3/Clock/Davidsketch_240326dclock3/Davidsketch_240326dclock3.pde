void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  textSize(25);
  text("Am", 600, 400);
  strokeWeight(0.5);
  stroke(255);
  scale(0.5);
  for (int i = 0; i<1440; i++)
  if (i <= total(minute())) {
    if(i==total(minute())){
          line(200, 100+i*1, 200+6*second(), 100+i);
    }else{
    line(200, 100+i*1, 600, 100+i);
    }
  }
}
//returns total minutes in a day
int total(int m){
  for(int i = 0; i<24;i++){
    if(i == hour()){
      return i*60+m;
    }
  }
  return m;
}
