//code runs at start
void setup() {
  size(800, 800);// set size to 800,800
  background(0); //set background to black 
  strokeCap(PROJECT); // set stroke cap to project
}
//float value to incriment rgb 
float c = 0;
Boolean backward = false; //boolean that determines which way the code incriments
//code runs every frame
void draw() {
  //translate to 400 and a random y position
  translate(400, random(-400, 1600));
  //set scale to 0.9
  scale(0.9);
  //set stroke weight to 1
  strokeWeight(1);
  //rotate by the frame count divided by pi/4
  rotate(frameCount/PI*0.25);
  
  //if c is greater than 254 then start  incrementing backwards
  //if c is less than or equal to zero start incrimenting forwards
   if(c > 254){
    backward = true;
  }
  if(c <= 0){
    backward = false;
  }
  
  if(backward == true){

    c-= random(2.099);
  }
  //increment up slightly slowly by only incrimenting when framecount is divisible by 2
  if(backward == false){
    if(frameCount%2==0){
  c+= random(0.90999099);
    }
  }
//add the lines that are gonna be spinning
//spinning sine wave
  for (float i=0; i<900; i+=0.9) {
    stroke(c,constrain(i, 0, random(255)),0, constrain(i, 0, random(255)));
    point(0 + i, 170+-9*sin(frameCount/PI * i * PI/16.6));
  }
 //more spinning lines with cosine waves tangent waves
 
  for (float i=0; i<900; i+=0.9) {
strokeWeight(random(1.5));
//make it switch between tan and cos using if framecount is divisible by 2
    if (frameCount%2==0) {
      point(0 + i, 170+-9*tan(frameCount/PI * i * PI/16.6));
    } else {
      point(0 + i, 170+-9*cos(frameCount/PI * i * PI/16.6));
    }
  }
}
