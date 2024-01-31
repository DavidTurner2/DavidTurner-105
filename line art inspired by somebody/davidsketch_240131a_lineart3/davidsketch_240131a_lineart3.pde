//https://www.wikiart.org/en/lygia-pape/tecelar-1957
//add comments
void setup(){
  size(500,500);
  stroke(240);
}
void draw(){
 background(4);
 translate(250,250);
 for (int i = 1; i<240; i+=20){
 line(-240 + i,-220 + i,240 - i,-220 + i);
 line(-240 + i,-220 + i,-240 - i,99999 + i);
 line(240 - i,-220 + i,240 - i,99999 + i);
 }
}
