/*inspired by Richard Paul Lohse
Farbstreifen - 1972 https://www.wikiart.org/en/richard-paul-lohse/farbstreifen-1972
*/

//code runs at start set size tp 540,800 and stroke to nostroke
void setup(){
  size(540,800);
  noStroke();
}
//runs every frame
void draw(){
  //set background to tinted light color
  background(#e1dcd5);

//loop that makes 6 rectangles in the center and makes that group of 6 go down 4 and make the opacity get more transparent when it goes down
  for (int i = 0; i<4; i++){
    //conditional statements that make the opacity for the green get changed
    if (i==0){
  fill(#b6cf88);
    }
    if(i==1){
      fill(#b6cf88, 180);
    }
    if(i==2){
          fill(#b6cf88, 120);

    }
    if(i==3){
          fill(#b6cf88, 60);

    }
    //3 green rectangles
  rect(190,0 + (i*200),30,200);
  rect(250,0+ (i*200),30,200);
  rect(310,0+ (i*200),30,200);
  //conditional statement that make the opacity for pink rectangles get changed
  if (i==0){
  fill(#e3b7c4);
  }
  if(i==1){
      fill(#e3b7c4,180);

  }
  if(i==2){
       fill(#e3b7c4,120);

  }
  if(i==3){
       fill(#e3b7c4,60);

  }
  //3 pink rectangles inbetween the green ones
  rect(220,0+ (i*200),30,200);
  rect(280,0+ (i*200),30,200);
  rect(340,0+ (i*200),30,200);
    
  }
}
//runs when mouse pressed
void mousePressed(){
  //save as png
  save(this + ".png");
}
