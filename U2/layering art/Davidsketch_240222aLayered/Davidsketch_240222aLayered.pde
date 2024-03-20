//code runs at start
void setup() {
  size(700, 700); // set size to 700,700
  background(0); //set background to black
}
//global variables
//for changing alpha values to fade in
float appear = 1;
//random x and y positions
float x = random(700);
float y = random(700);
//color pallete for the circles to chose from
color[] pallete = {#1D5AF5, #6B1DF5, #492B6F, #16186F, #91201A};
//variable that picks a random color from color pallete
color p = int(random(pallete.length-1));
void draw() {
  //run function that makes circles fade in
  timeup();
  //use appear variable to make dark lines
  stroke(appear);
  //random lines going off the page diagonally
  line(random(0, 700), random(0, 700), 9999, 9999);
  //use appear variable to make dark blue  lines
  stroke(appear*2, appear*3, appear*20);
  //random lines going off the page diagonally in the other direction
  line(-9999, 9999, random(0, 700), random(0, 700));
}

//function that makes circles appear over time
void timeup() {
  //if appear is greater than 10 reset the variable and choose another random position and color from color pallete
  if (appear > 10)
  {
    appear=0;
    x = random(700);
    y = random(700);
    p = int(random(pallete.length-1));
  } else
    if (frameCount%19==0) { // if frame count is divisiable by 19 then incrimment the appear variable.
      appear+= 2.1;
    }
  //turn off stroke and draw the circle that fades in and position
  noStroke();
  fill(pallete[p], appear);
  circle(x, y, 500);
}
