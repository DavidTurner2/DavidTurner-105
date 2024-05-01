//code runs at start
void setup(){
  //set size to 800,800
  size(800,800);
}
//code runs everyframe
void draw(){
  //set background to brown
  background(104,96,40);
  //set fill to dark red
  fill(40,0,7);
  //whenever i push
  pushMatrix();
  //translate and rotate these shapes
translate(400,20);
rotate(0.1);
//make repeating ellipses and rectangle and triangles vertically
  for(int i = -40; i<40; i++){
  triangle(410,407+i*15,447,400+i*15.07,354,420+i*14.67);
  ellipse(120,407+i*15,95,9);
  rect(245,400+i*15.03,93,7);
  }  
  popMatrix();
  //make repeating ellipses and rectangle and triangles vertically
  for(int i = -40; i<40; i++){
  triangle(400,407+i*15,447,400+i*15,354,400+i*15);
  ellipse(180,407+i*15,95,9);
  rect(245,400+i*15,93,7);
  }
    //rotating lines moving up and down
    
        translate(-200+50*sin(frameCount/99.009),-200+50*cos(frameCount/99.009));
 for(int i = 0; i<50; i++){
        strokeWeight(6);

  line(400,400+i*8,800,400+i*8);
}
rotate(sin(frameCount/200.0908));
    translate(-200+50*sin(frameCount/99.009),-200+50*cos(frameCount/99.009));
  for(int i = 0; i<50; i++){
        strokeWeight(6);

  line(400,400+i*8,800,400+i*8);
      strokeWeight(1);
//off set these lines change stroke weig
    line(440,420+i*8,810,406+i*7.90);

  }
}
