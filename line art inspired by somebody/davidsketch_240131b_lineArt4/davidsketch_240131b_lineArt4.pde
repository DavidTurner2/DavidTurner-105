/*inspired by Lothar Charoux
Squares - 1970 https://www.wikiart.org/en/lothar-charoux/squares-1970
*/

//function that runs at start 
void setup(){
 //set window size to 480,580 
 size(480,580); 
 
}

//function that runs every frame
void draw(){
 //set background to the color 65
  background(65);
  //seting variables that ive been reusing to tweak them more easily
  float greyline = 130;
  float cornerx = 450;
  float cornery = 300;
  float hguidex = 240;
  float hguidey = 160;
  //vector that i use to make a segmented line
  PVector temp = new PVector(290,17);
  
  //create top and bottom of tilted square
  line(240 - 0*10.00,160 - 0*-14.79,450 + 0*-10.05,300 - 0 *-14.83);
  line(240 - 14*10.00,160 - 14*-14.79,450 + 14*-10.05,300 - 14 *-14.83);
   
  //loop that makes the all the lines of the shape on the outer edjes and vertical line inside the tilted square
  for(int i=0;i<15;i++){
   //vertical lines inside of tilted square being created by the for loop using the value of i to position it
    line(cornerx - (i*15),(cornery -(i*10)),(cornerx - (i*15)) - 140,(cornery -(i*10)) + 206);
    //make lighter line in middle
    if(i == 7){
      stroke(155);
      strokeWeight(2.1);
      line(cornerx - (i*15),(cornery -(i*10)),(cornerx - (i*15)) - 140,(cornery -(i*10)) + 206);
    }
    //set stroke color and stroke weight
     stroke(greyline);
     strokeWeight(1.5);

  
  //vertical lines extruding from top of tilted square
  line(450 - (i *15),0,cornerx - (i*15),cornery - (i*10));
  //horizintal lines extruding from the left of tilted square
  line(0,hguidey- i*-14.79,hguidex - i*10.05,hguidey- i*-14.79);
  //horizintal lines extruding from the right of tilted square
  line(cornerx - i*10,cornery - i*-14.79,999,cornery - i*-14.79);
  //vertical lines extruding from bottom of tilted square
  line((cornerx - i*15)-140, (cornery -i*10)+206,cornerx - i*15, 9999);
  }
  
//variables to manually tweak the gradient
  float tweak = 0.67;
  float tweak2 = 0.73;
  float tweak3 = 0.65;
  float tweak4 = 0.58;
  float tweak5 = 0.52;
  float tweak6 = 0.42;
  float tweak7 = 0.51;
  //variables i made from trial and error to align the segmented lines correctly
  float idk = -17.70; 
  float idk2 = 0.2;
  //push matrix so that the roation doesnt affect the lines in the loop thats above
    pushMatrix();
//segment of the loop
 float seg = 18;



  //rotate the segmented line
     rotate(0.59);
     //loop for applying gradient
for(int k = 0; k<13; k++){
  //loop for segmented line
   for (int j = 0; j<seg * 14; j+=seg) {
     //affecting all horizontal lines beyond the first one
     if (k>=1){
    if (j == seg * 5 || j == seg * 8){
   if(k==4){
       strokeWeight(2);
   }else if(k==5){
       strokeWeight(2.1);
   }
   else if(k==6){
       strokeWeight(2.2);
   }
    else if(k==7){
       strokeWeight(2.4);
   }
   else if(k==8){
       strokeWeight(2.4);
   }
   else if(k==9){
       strokeWeight(2.2);
   }
    else if(k==9){
       strokeWeight(2);
   }
   else if(k==9){
       strokeWeight(2);
   }
      stroke(lerpColor(50,255,tweak));

    }
    else if(j == seg * 6 || j == seg * 7){
if(k==4){
       strokeWeight(2);
   }else if(k==5){
       strokeWeight(2.1);
   }
   else if(k==6){
       strokeWeight(2.2);
   }
    else if(k==7){
       strokeWeight(2.4);
   }
   else if(k==8){
       strokeWeight(2.4);
   }
   else if(k==9){
       strokeWeight(2.2);
   }
    else if(k==9){
       strokeWeight(2);
   }
            stroke(lerpColor(50,255,tweak2));
    }
    else{
            stroke(greyline);
    }
   } 
   if(k==0){
        if(j<seg * 6 || j>seg * 7 ){
       stroke(greyline);
   }
        if(j == seg * 6 || j == seg * 7){

            stroke(lerpColor(50,255,tweak7));
    }
     }
   if (k>0){
     if(j==seg * 4 || j==seg *9){
        stroke(lerpColor(50,255,tweak3));
     }
   }
     if (k>1){
     if(j==seg * 3 || j==seg *10){
        stroke(lerpColor(50,255,tweak4));

     }
   }
   if (k>2){
     if(j==seg * 2 || j==seg *11){
        stroke(lerpColor(50,255,tweak5));

     }
   }
     if (k>3){
     if(j==seg * 1 || j==seg *12){
        stroke(lerpColor(50,255,tweak6));
     }
    
   }
   
   if (k==12){
     if(j<seg * 6 || j>seg * 7 ){
       stroke(greyline);
   }
   if(j == seg * 6 || j == seg * 7){
      stroke(lerpColor(50,255,tweak7));
    }
   }
   
   if (k==11){
     if(j<seg * 5 || j>seg * 8 ){
       stroke(greyline);
     }
   }
   if (k==10){
     if(j<seg * 4 || j>seg * 9 ){
       stroke(greyline);
     }
   }
   if (k==9){
     if(j<seg * 3 || j>seg * 10 ){
       stroke(greyline);
     }
   }
    if (k==8){
     if(j<seg * 2 || j>seg * 11 ){
       stroke(greyline);
     }
   }
    if (k==7){
     if(j<seg * 1 || j>seg * 12 ){
       stroke(greyline);
     }
   }
     
    line(temp.x + j - (k*idk2), temp.y - (k*idk), temp.x +(j+ seg), temp.y - (k*idk));
         strokeWeight(1.5);
   }
}

  
  
  
  //revert matrix to how it was before
 popMatrix();
 //creating shadow thing
   stroke(80,50);
   strokeWeight(4);
   line(337,248,217,423);
   //create white line getting bigger with quad
   strokeWeight(2);
   stroke(200,100);
   fill(220);
   quad(335,245,296,306,214,423,284,319);
  
}

void mousePressed() {
  //save the screen as a png file
  save("InspiredArt4.png");
}
