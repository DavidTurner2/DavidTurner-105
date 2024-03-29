//set global variable
PFont font;
//code runs at start
void setup() {
  //set size to 650,2525
  size(650, 2525);
  //assign font to font in data by loading it
  font = loadFont("ZapfDingbatsITC-48.vlw");
}
//global array variable of strings of all the stops im using 
String stops[]= {"Flatbush Av-\nBrooklyn College", "Newkirk Av-\nLittle Haiti",
  "Beverly Rd",
  "Church Av",
  "Winthrop St",
  "Sterling St",
  "President St-\nMedgar Evers College",
  "Franklin Av-\nMedgar Evers College",
  "Eastern Pkwy-\nBrooklyn Museum",
  "Grand Army Plaza",
  "Bergen St",
  "Atlantic Av-\nBarclays Ctr",
  "Nevins St",
  "Hoyt St",
  "Borough Hall",
  "Clark St",
  "Wall St",
  "Fulton St",
  "Park Place",
  "Chambers St",
  "14 St",
  "34 St-Penn Station",
  "Times Sq-42 St",
  "72 St",
  "96 St",
  "Central Park North \n(110 St)",
  "116 St",
  "125 St",
  "135 St",
  "149 St-Grand Concourse"
};
//code runs every frame
void draw() {
  //set background to black
  background(0);
  //red circle with big white 2 inside that makes it look like the 2 train icon
  fill(#ff0000);
  circle(604, 2475, 54);
  textFont(font, 40);
  fill(244);
  text("2", 594, 2489);
  //revert text to normal size
  textFont(font, 23);

//create two doors one open and one closed that explains what the icons mean
  door(329, 862, 0);
  door(329, 595, 1);
  fill(200);
  text("opens", 569, 1439);
  fill(244);
  text("stays closed", 524, 1171);
//divider line of the direction
  stroke(255);
  strokeWeight(0.7);
  line(273, 0, 273, 9000);
  strokeWeight(12);
  
  //red routelines

  stroke(#ff0000);
  line(392, 0, 392, 2488);
  line(114, 35, 114, 2600);
  //change stroke weight to 2
  strokeWeight(2);
  
  //doors and stops displayed next to red route lines
  //scale it down
  scale(0.56);
  //move everything slightly
  translate(-40, 0);
  //loop that displays doors and circles and stops
  for (int i = 0; i<30; i++) {
    //conditional statements that determine if the door is opened or closed
    if (i>=0 && i <6 || i>=22 && i<25 || i>=26) {
      //door open on right
      door(416, 3900-i*150, 0);
      door(313, 3900-i*150, 1);
    } else if (i==6 ||i==7 || i==9 || i==12 || i==21 || i==25) {
      //door open on left
      door(416, 3900-i*150, 1);
      door(313, 3900-i*150, 0);
    } else if (i==8 || i==10 || i==11|| i==13 || i==19 || i==20) {
      //door open on right
      door(416, 3900-i*150, 0);
      door(313, 3900-i*150, 1);
    } else if (i>=14 && i<19 ) {
      //door open on left
      door(416, 3900-i*150, 1);
      door(313, 3900-i*150, 0);
    }
    //grey circle as the stop
    fill(102);
    stroke(0);
    circle(741.0, 4424-i*150, 19);
    //white text displaying stops through array
    fill(255);
    text(stops[i], 757, 4430-i*150);
    //text that says the direction
    text("Uptown & The Bronx (Northbound)", 650, 4500);

  }
  //move everything slightly
  translate(-495, 0);
  //loop that displays doors and circles and stops
  for (int i = 0; i<30; i++) {
        //conditional statements that determine if the door is opened or closed
    if (i>=0 && i <4 || i>=5 && i<=7 || i>=24 && i<=28) {
      //door open on right
      door(416, 3900-i*150, 0);
      door(313, 3900-i*150, 1);
    } else if (i==4 ||i==8 ||  i==12 || i==17 || i==25|| i==20||i==22|| i==23) {
      //door open on left
      door(416, 3900-i*150, 1);
      door(313, 3900-i*150, 0);
    } else if (i==8 || i==10 || i==9|| i==15 || i==16|| i==18|| i==19|| i==21) {
      //door open on right
      door(416, 3900-i*150, 0);
      door(313, 3900-i*150, 1);
    } else if (i>=11 && i<15 ) {
      //door open on left
      door(416, 3900-i*150, 1);
      door(313, 3900-i*150, 0);
    } else if (i==29) {
      //door could open on both sides
      door(416, 3900-i*150, 0);
      door(313, 3900-i*150, 0);
      fill(168);
      text("<-either->", 594, 72-i);
    }
    //grey circle as the stop
    fill(102);
    stroke(0);
    circle(739.5, 4424-i*150, 19);
    fill(255);
    //white text displaying stops through array in reverse
    text(stops[stops.length-i-1], 757, 4430-i*150);
    //text that says the direction
    text("Downtown & Brooklyn (Southbound)", 620, 4500);
  }
}
//draws door takes 3 parameters for position x position y and a value that determines wether its open or closed
void door(float x, float y, int open) {
  //if open is 0 draw open door
  if (open==0) {
    stroke(182);
    noFill();
    //rounded door shape
    rect(x+250, y+500, 43, 50, 10, 10, 0, 0);
  //  rect(x+256-9, y+506, 11, 21, 19, 19, 20, 18);
  //  rect(x+275+9, y+506, 11, 21, 19, 31, 48, 16);
  //simulate doors sliding out
    line(x+271-15, y+501, x+271-15, y+550);
    line(x+271+15, y+501, x+271+15, y+550);
    //fill(0);
    //noStroke();
   // rect(x+294, y+500, 3, 50);
    //rect(x+239.3, y+500, 10, 50);
  } else {
    //closed door with windows
    stroke(240);
    noFill();
    rect(x+250, y+500, 43, 50, 10, 10, 0, 0);
    rect(x+254, y+506, 11, 21, 3, 3, 3, 3);
    rect(x+277, y+506, 11, 21, 3, 3, 3, 3);
    line(x+271, y+500, x+271, y+550);
  }
}
//code runs when mouse is pressed
void mousePressed(){
 //save as png
 save(this+".png");
}
