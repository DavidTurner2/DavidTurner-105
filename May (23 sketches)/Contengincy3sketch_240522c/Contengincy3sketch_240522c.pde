//King Of The Mountains – Zoetrope
void setup() {
  size(800, 800);
}

void draw() {
  background(#2a6337);
  stroke(#dbdfb6);
  for(int i = 0; i<81;i++){
   line(i*pow(2.0,2)+109,733+i*-8.3, i*-2.9+604,736+i*-8.6);
  }
}
