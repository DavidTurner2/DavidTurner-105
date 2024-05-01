//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
  //set rectmode to center
  rectMode(CENTER);
  //change frame rate to 50
  frameRate(50);
}
//create step variable for animating object
float step = 0;
//create seperate variable for rotating the square
float rotatestep = 0;
//variable gets incremnted looping through a time
int loop=0;
//code runs every frame
void draw() {
  //make PVector array of all places for circles to travel to
  PVector[] places = {new PVector(200, 250),
    new PVector(600, 250),
    new PVector(600, 600),
    new PVector(200, 600),
    new PVector(200, 250),
    new PVector(600, 250), };
  //set background to dark green
  background(#005039);
  //increment step
  step+=0.01;
  //increment rotatestep by step * 12.5
  rotatestep=step*12.5;
  //turn off stroke
  noStroke();
  //translate to 400,400 then rotate and translate to -400,-400 so that the squares stays spinning in center
  translate(400, 400);
  rotate(PI * 0.1*sin(rotatestep/2));
  translate(-400, -400);
  //animated red values
  fill(50+100*tan(step/1.3), 0, 0);
  //make the sides of this quad animated
  //the top left and bottom right using tangent so it goes off screen
  quad(places[0].x-50*abs(1/tan(rotatestep/4)), places[0].y-50,
    places[1].x+50, places[1].y-50*sin(rotatestep/4),
    places[2].x+50*abs(tan(rotatestep/4)), places[2].y+50,
    places[3].x-50, places[3].y+50*sin(rotatestep/4));
  //animated green to blue values using tangent so it pops
  fill(0, -60+ 80*1/tan(step/1.3)+87, 90+ 57*1/tan(rotatestep/2));
  //regular square
  quad(places[0].x, places[0].y,
    places[1].x, places[1].y,
    places[2].x, places[2].y,
    places[3].x, places[3].y);
  //set stroke weight to 9
  strokeWeight(9);
  //for loop for controlling the ball locations
  for (int j = 0; j<4; j++) {
    if (loop == j) {
      //create balls
      for (int i = 0; i<8; i++) {
        //based on what value the loop is make the balls follow different easing and get to the places in differnt ways
        if (j==0) {
          stroke(8*40-i*40);
          point(lerp(i*40+places[j].x, places[j+1].x, constrain((float)easeOutBounce(step), 0, 1)), lerp(places[j].y, places[j+1].y, constrain((float)easeOutBounce(step), 0, 1)));
        }
        if (j==1) {
          stroke(i*40);
          point(lerp(places[j].x, places[j+1].x, constrain(step, 0, 1)), lerp(places[j].y, i*40+places[j+1].y, constrain((float)easeOutQuart(step), 0, 1)));
        }
        if (j==2) {
          stroke(i*40);
          point(lerp(places[j].x, places[j+1].x, constrain((float)easeOutQuart(step), 0, 1)), lerp(i*40+places[j].y, places[j+1].y, constrain((float)easeOutBounce(step), 0, 1)));
        }
        if (j==3) {
          stroke(8*40-i*40);
          point(lerp(places[j].x, i*40+places[j+1].x, constrain(step, 0, 1)), lerp(places[j].y, places[j+1].y, constrain((float)easeOutQuart(step), 0, 1)));
        }
      }
    }
  }
  //when step goes over 1 increment loop by 1
  if (step > 1) {
    step = 0;
    loop+=1;
    //when loop is 4 set it to zero
    if (loop==4) {
      //noLoop();
      loop=0;
    }
  }
  //if rotate step is greater than 4 set it to zero
  if (rotatestep > 4) {
    rotatestep = 0;
  }
  // saveFrame("frames/####.png");
}


//easing functions from easings.net

double easeOutBounce(float x) {
  double n1 = 7.5625;
  double d1 = 2.75;

  if (x < 1 / d1) {
    return n1 * x * x;
  } else if (x < 2 / d1) {
    return n1 * (x -= 1.5 / d1) * x + 0.75;
  } else if (x < 2.5 / d1) {
    return n1 * (x -= 2.25 / d1) * x + 0.9375;
  } else {
    return n1 * (x -= 2.625 / d1) * x + 0.984375;
  }
}

double easeOutQuart(float x) {
  return 1 - Math.pow(1 - x, 4);
}
