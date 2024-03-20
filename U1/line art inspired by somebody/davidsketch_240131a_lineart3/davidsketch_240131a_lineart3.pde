//inspired by Lygia Pape
//Tecelar - 1957 https://www.wikiart.org/en/lygia-pape/tecelar-1957
//code runs at start
void setup(){
  //set size to 500,500
  size(500,500);
  //set stroke to white 
  stroke(240);
}
//code runs every frame
void draw(){
  //set background to black
 background(4);
 //translate to 250,250
 translate(250,250);
 //loop that makes a open rectangles and expands it
 for (int i = 1; i<240; i+=20){
 line(-240 + i,-220 + i,240 - i,-220 + i);
 line(-240 + i,-220 + i,-240 - i,99999 + i);
 line(240 - i,-220 + i,240 - i,99999 + i);
 }
}

//code runs when mouse is pressed
void mousePressed(){
  //save as png
  save(this+".png");
}
