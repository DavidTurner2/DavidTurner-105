PShape vending;
PShape can;
PShape water;
PShape bag;
PShape dollar;
PShape quarter;
PShape silver;
PShape penny;

PVector c[] = new PVector[7];
PVector[] A = new PVector[8];
PVector[] B = new PVector[8];
PVector[] C = new PVector[8];
PVector[] D = new PVector[8];
PVector[] buttons = new PVector[12];
String[] items = {"A", "B", "C", "D", "1", "2", "3", "4", "5", "6", "7", "8"};
Boolean[] pressed = {false, false, false, false, false, false, false, false, false, false, false, false};
PVector[] spawnLocations = {new PVector(-40, 83.4, -130), new PVector(-56, 83.4, -101), new PVector(-178, 83.4, -104), new PVector(-140, 83.4, -104), new PVector(-230, 83.4, -117), new PVector(-282, 83.4, -248), new PVector(-86, 83.4, -100)};

//sky from textures.com
PImage sky;
Vending[] vm = new Vending[100];
Player p = new Player();
PVector sel = new PVector(0, 0);
PVector sel3d = new PVector(0, 0);
PVector sel4d = new PVector(0, 0);
int money = 0;

float zoom = 0;
Boolean zoomed = false;
float nextOne = 0;
boolean goLeft = false;
boolean goRight = false;
Boolean shop = false;
Boolean purchase = false;
int current = 0;
void setup() {
  //create vending machine objects
  for(int i = 0; i<100;i++){
  vm[i] = new Vending();
  }
  //set size to 800,800 and render in p3d mode
  size(800, 800, P3D);
  //load images and 3d objects
  sky = loadImage("sky.png");
  vending = loadShape("vending.obj");
  can = loadShape("can.obj");
  water = loadShape("water.obj");
  bag = loadShape("bag.obj");
  dollar = loadShape("Dollar.obj");
  quarter = loadShape("Quarter.obj");
  silver = loadShape("Silver.obj");
  penny = loadShape("Penny.obj");

  //set targets for displaying row letters and numbers
  for (int j = 0; j<A.length; j++) {
    A[j] = new PVector(377+j*9.29, 376+j*-0.11);
  }
  for (int j = 0; j<B.length; j++) {
    B[j] = new PVector(377+j*9.29, 376+20+j*-0.11);
  }
  for (int j = 0; j<C.length; j++) {
    C[j] = new PVector(377+j*9.29, 376+40+j*-0.11);
  }
  for (int j = 0; j<D.length; j++) {
    D[j] = new PVector(377+j*9.29, 376+58+j*-0.11);
  }

  buttons[0] = new PVector(260, 340);
  buttons[1] = new PVector(370, 340);
  buttons[2] = new PVector(480, 340);
  buttons[3] = new PVector(260, 440);
  buttons[4] = new PVector(370, 440);
  buttons[5] = new PVector(480, 440);
  buttons[6] = new PVector(260, 540);
  buttons[7] = new PVector(370, 540);
  buttons[8] = new PVector(480, 540);
  buttons[9] = new PVector(260, 640);
  buttons[10] = new PVector(370, 641);
  buttons[11] = new PVector(480, 641);
  //turn off stroke
  noStroke();
}

void draw() {

  //setting cursors
  sel.set(mouseX, mouseY);
  sel4d.set(map(mouseX, 0, 800, 346, 455), map(mouseY, 0, 800, 346, 455));
  sel3d.set(map(mouseX, 0, 800, 250, 550), map(mouseY, 0, 800, 250, 550));
  //set background to sky
  background(sky);
  //directional light
  if (shop ==false) {
    directionalLight(95, 95, 95,
      -11, 29, 6);
  } else {
    lights();
  }


  //controlling zoom
  if (zoomed) {
    if (zoom<161.5) {
      zoom+=3.1;
    }
  } else {
    if (zoom<0.5) {
      zoom=0;
    } else {
      zoom-=3.1;
    }
  }

  if (goLeft&&goRight==false) {
    nextOne-=3.1;
    if (nextOne<-333) {
      if(current<100){
      current++;
      nextOne =333;
      goRight = true;
      println(nextOne);
      }else{
       current = 0;
       nextOne = 0;
      }
    }
  }
  if (goRight) {
    nextOne-=3.1;
    if(nextOne<=0){
      goLeft = false;
     goRight=false; 
     nextOne = 0;
    }
  }

  //grass
  pushMatrix();
  if (shop==false) {
    scale(9);
    translate(7, 358, 121);
    fill(#88f988);
    box(833, 601, 921);
  }
  popMatrix();

  //vending machine +player
  pushMatrix();
  if (shop) {
    translate(1000, 1000, 1000);
  }


  translate(nextOne, 0, zoom);
  vm[current].update();
  popMatrix();
  p.update(current);
}
//vending machines array of objects
//seperate player class saves stuff from vending machine and money
void mouseClicked() {

  if (p.inspect == "Zoom in") {
    zoomed = true;
  }
  if (zoomed && zoom >161) {
    zoomed = false;
  }
}
class Player {
  IntList inventory = new IntList();
  String inspect = "";
  String text = "Enter Item #";
  String value = "";
  float tc = 0;
  Boolean once = false;
  int cart = 0;
  PVector next = new PVector(504, 344);
  PVector back = new PVector(187, 344);
  PVector glass = new PVector(357, 344);
  PVector screen = new PVector(319, 340);
  PVector change = new PVector(327, 437);
  int item;
  int row;
  Player() {
    c[0] = new PVector(473, 486);
    c[1] = new PVector(463, 494);
    c[2] = new PVector(356, 492);
    c[3] = new PVector(388, 493);
    c[4] = new PVector(315, 488);
    c[5] = new PVector(311, 462);
    c[6] = new PVector(434, 495);
  }
  void update(int v) {
    inspect = "";
    if (tc>0) {
      tc-=2.239f;
    } else if (once) {
      text = "ENTER ITEM #";
      once = false;
      for (int i = 0; i<pressed.length; i++) {
        pressed[i]=false;
      }
    }


    fill(#6b8093);


    if (zoomed == false&&shop == false&&goRight==false&&goLeft==false) {
      for (int i = 0; i<c.length; i++) {
        if (c[vm[v].pick.get(i)].dist(sel3d)<6) {
          fill(#FFFFFF);
          if (vm[v].moneyLeft[i]>0) {
            inspect = (vm[v].moneyLeft[i]+"¢");
            if (mousePressed) {
              money+= vm[v].moneyLeft[i];
              vm[v].moneyLeft[i] = 0;
            }
          }
        }
      }
      //next machine
      if (sel3d.x>next.x && sel3d.x<next.x+100 && sel3d.y>next.y&&sel3d.y<next.y+240&&goRight==false&&goLeft==false) {
        inspect = ">>>";

        if (mousePressed) {
          goLeft = true;
        }
      }
      //back home
      if (sel3d.x>back.x && sel3d.x<back.x+100 && sel3d.y>back.y&&sel3d.y<back.y+240&&goRight==false&&goLeft==false) {
        inspect = "Go Home";
        if (mousePressed) {
        inspect = "UNFORTUNUTELY THIS IS A DEMO";
        }
      }
      //inspect glass
      if (sel3d.x>glass.x && sel3d.x<glass.x+105 && sel3d.y>glass.y&&sel3d.y<glass.y+109&&goRight==false&&goLeft==false) {
        inspect = "Zoom in";
        if (mousePressed&&shop==false) {
          zoomed = true;
        }
      }
      //screen
      if (sel3d.x>screen.x && sel3d.x<screen.x+37 && sel3d.y>screen.y&&sel3d.y<screen.y+93&&goRight==false&&goLeft==false) {
        inspect = "Buy Item";
        if (mousePressed&&zoomed == false) {
          shop = true;
        }
      }
      //change
      if (sel3d.x>change.x && sel3d.x<change.x+21 && sel3d.y>change.y&&sel3d.y<change.y+31&&goRight==false&&goLeft==false) {
        if ( vm[v].change>0) {
          inspect = vm[v].change+"¢";
          if (mousePressed) {
            money+= vm[v].change;
            vm[v].change = 0;
          }
        }
      }
    } else if (zoomed) {
      translate(0, 0, 600);
      // circle(sel4d.x, sel4d.y, 10);
      for (int i = 0; i<A.length; i++) {
        if (A[i].dist(sel4d)<8) {
          inspect = "A"+(8-i);
        }
      }
      for (int i = 0; i<B.length; i++) {
        if (B[i].dist(sel4d)<8) {
          inspect = "B"+(8-i);
        }
      }
      for (int i = 0; i<C.length; i++) {
        if (C[i].dist(sel4d)<8) {
          inspect = "C"+(8-i);
        }
      }
      for (int i = 0; i<D.length; i++) {
        if (D[i].dist(sel4d)<8) {
          inspect = "D"+(8-i);
        }
      }
      textSize(10.5);
      text(inspect, -7+sel4d.x, sel4d.y, 7);
    } else if (shop) {

      fill(89);
      rect(0, 0, 800, 800);
      fill(0);
      rect(200, 12, 400, 272);
      textSize(20);
      fill(0);
      text("player money:"+money+"¢", 50, 300);
            text("player inventory\n"+inventory, 20, 400);

      fill(#455F41);
      textSize(44);
      text(text, 284, 142);
      fill(200, 80, 90);
      if (sel.x>200&&sel.x<200+400&&sel.y>720&&sel.y<720+70) {
        fill(255, 75, 60);
        if (mousePressed) {
          shop=false;
        }
      }

      rect(200, 720, 400, 70);
      fill(255);
      text("Exit", 350, 760);

      if (purchase) {
        textSize(30);

        fill(#44c644);
        if (sel.x>480&&sel.x<480+100&&sel.y>172&&sel.y<172+100) {
          fill(#12cf53);
          if (mousePressed) {
            if (money>= cart) {
              text = "Enter Item #";
              money -= cart;
              clearMachine();
              //start animation
              if (row == 1) {
                inventory.append(vm[v].row1[item-1][1]);
              } else if (row==2) {
                inventory.append(vm[v].row2[item-1][1]);
              } else if (row==3) {
                inventory.append(vm[v].row3[item-1][1]);
              } else if (row==4) {
                inventory.append(vm[v].row4[item-1][1]);
              }
              shop=false;
            } else {
              text = "INSUFFICENT\nFUNDS";
              clearMachine();
            }
          }
        }
        rect(480, 172, 100, 100);
        fill(0);
        text("PAY", 508, 231);
        fill(#8c3636);
        if (sel.x>220&&sel.x<220+100&&sel.y>172&&sel.y<172+100) {
          fill(#ffffff);
          if (mousePressed) {
            text = "PAYMENT\nCANCELLED";
            clearMachine();
          }
        }
        rect(220, 172, 100, 100);
        fill(0);
        text("CANCEL", 220, 231);
      }


      textSize(50);
      if (value.length()>1) {

        if (value.charAt(0) == 'A'&&purchase==false) {
          for (int i = 1; i<9; i++) {
            if (value.charAt(1) == ('0'+i)) {
              if (vm[v].row1[i-1][0]>0) {
                if (vm[v].row1[i-1][1]==0) {
                  row =1;
                  item = i;
                  cart = 250;
                  text = "SELECTED: $2.50";
                  purchase = true;
                }
                if (vm[v].row1[i-1][1]==1) {
                  row =1;
                  item = i;
                  text = "SELECTED: $3.50";
                  cart = 350;
                  purchase = true;
                }
                if (vm[v].row1[i-1][1]>1) {
                  row =1;
                  item = i;
                  cart = 450;
                  text = "SELECTED: $4.50";
                  purchase = true;
                }
              } else {
                text = "OUT OF STOCK";
                clearMachine();
                return;
              }
            }
          }
        }

        if (value.charAt(0) == 'B'&&purchase==false) {
          for (int i = 1; i<9; i++) {
            if (value.charAt(1) == ('0'+i)) {
              if (vm[v].row2[i-1][0]>0) {
                if (vm[v].row2[i-1][1]==0) {
                  row =2;
                  item = i;
                  cart = 250;
                  text = "SELECTED: $2.50";
                  purchase = true;
                }
                if (vm[v].row2[i-1][1]==1) {
                  row =2;
                  item = i;
                  text = "SELECTED: $3.50";
                  cart = 350;
                  purchase = true;
                }
                if (vm[v].row2[i-1][1]>1) {
                  row =2;
                  item = i;
                  cart = 450;
                  text = "SELECTED: $4.50";
                  purchase = true;
                }
              } else {
                text = "OUT OF STOCK";
                clearMachine();
                return;
              }
            }
          }
        }

        if (value.charAt(0) == 'C'&&purchase==false) {
          for (int i = 1; i<9; i++) {
            if (value.charAt(1) == ('0'+i)) {
              if (vm[v].row3[i-1][0]>0) {
                if (vm[v].row3[i-1][1]==0) {
                  row =3;
                  item = i;
                  cart = 250;
                  text = "SELECTED: $2.50";
                  purchase = true;
                }
                if (vm[v].row3[i-1][1]==1) {
                  row =3;
                  item = i;
                  text = "SELECTED: $3.50";
                  cart = 350;
                  purchase = true;
                }
                if (vm[v].row3[i-1][1]>1) {
                  row =3;
                  item = i;
                  cart = 450;
                  text = "SELECTED: $4.50";
                  purchase = true;
                }
              } else {
                text = "OUT OF STOCK";
                clearMachine();
                return;
              }
            }
          }
        }

        if (value.charAt(0) == 'D'&&purchase==false) {
          for (int i = 1; i<9; i++) {
            if (value.charAt(1) == ('0'+i)) {
              if (vm[v].row4[i-1][0]>0) {
                if (vm[v].row4[i-1][1]==0) {
                  row =4;
                  item = i;
                  cart = 250;
                  text = "SELECTED: $2.50";
                  purchase = true;
                }
                if (vm[v].row4[i-1][1]==1) {
                  row =4;
                  item = i;
                  text = "SELECTED: $3.50";
                  cart = 350;
                  purchase = true;
                }
                if (vm[v].row4[i-1][1]>1) {
                  row =4;
                  item = i;
                  cart = 450;
                  text = "SELECTED: $4.50";
                  purchase = true;
                }
              } else {
                text = "OUT OF STOCK";
                clearMachine();
                return;
              }
            }
          }
        }


        if (value.charAt(1)=='A'||value.charAt(1)=='B'||value.charAt(1)=='C'||value.charAt(1)=='D') {
          value="";
          for (int i = 0; i<pressed.length; i++) {
            pressed[i]=false;
          }
          return;
        }
      }
      for (int i = 0; i<buttons.length; i++) {
        fill(0);
        if (pressed[i]==false&&sel.x>buttons[i].x&&sel.x<buttons[i].x+60&&sel.y>buttons[i].y&&sel.y<buttons[i].y+60) {
          if (mousePressed) {
            pressed[i] = true;
            once = false;
            value+=items[i];
            text = value;
          }
          fill(20);
        }
        rect(buttons[i].x, buttons[i].y, 60, 60, 12);
        fill(#455F41);
        text(items[i], 17+buttons[i].x, 45+buttons[i].y);
      }
    }

    translate(0, 0, 440);
    textSize(12);
    text(inspect, 10+sel3d.x, sel3d.y, 10);
    //noFill();
    //circle(sel3d.x, sel3d.y, 10);
    /*for (int i = 0; i<c.length; i++) {
     circle(c[i].x, c[i].y, 10);
     }
     
     
     
     
     
     rect(next.x, next.y, 100, 240);
     rect(back.x, back.y, 100, 240);
     rect(glass.x, glass.y, 105, 109);
     rect(screen.x, screen.y, 37, 93);
     rect(change.x, change.y, 21, 31);
     */
    //println(mouseX, " , ", mouseY);
  }
  void clearMachine() {
    once = true;
    tc = 150;
    cart = 0;
    value = "";
    purchase = false;
  }
}
