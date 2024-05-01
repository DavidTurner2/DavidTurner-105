class Vending {
  //spawn locations
  //pick randomoly without duplicates
  IntList pick = new IntList(0, 1, 2, 3, 4, 5, 6);
  //quantity and type
  int[][] row1 = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}};
  int[][] row2 = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}};
  int[][] row3 = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}};
  int[][] row4 = {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}};
  int change = 0;
  //coin values
  int[] cents = {0, 0, 0, 25, 0, 10, 10, 10, 10, 25, 25, 25, 1, 1, 1, 0, 0, 1, 1, 1, 5, 0, 5, 5, 5, 5, 25, 10, 25, 100};
  //stored values of money thats left
  int[] moneyLeft = new int[cents.length];
  //coins spawned
  int cs;
  Vending() {
    //shuffle order
    pick.shuffle();
    int rng = int(random(2));
    if(rng==0){
    change += cents[int(random(cents.length))]+ cents[int(random(cents.length))]+ cents[int(random(cents.length))];
    }
    //set random items and how much of it is in each row of the vending machines
    for (int i = 0; i<row1.length; i++) {
      row1[i][0]=int(random(5));  //quantity
      row1[i][1]=int(random(4));  //type
    }
    for (int i = 0; i<row2.length; i++) {
      row2[i][0]=int(random(5));
      row2[i][1]=int(random(4));
    }
    for (int i = 0; i<row3.length; i++) {
      row3[i][0]=int(random(5));
      row3[i][1]=int(random(4));
    }
    for (int i = 0; i<row4.length; i++) {
      row4[i][0]=int(random(5));
      row4[i][1]=int(random(4));
    }
    //maximum of 4 coins left around machine
    cs = int(random(1));
    for (int i = 0; i<cs; i++) {
      //choose from cents to be more realistic instead of it being a random number
      moneyLeft[i] = cents[int(random(cents.length))];
    }
  }

  void update() {
    //translate for the whole vending machine
    translate(453-mouseX/43, 397-mouseY/43, 454);
    rotateY(-mouseX/10043.78);

    //vending machine and lights and glass pane

    pushMatrix();
    //light 1
    scale(1);
    pointLight(255, 255, 255, 0, 2, -2);
    //light 2
    translate(-113, 0, 0);
    pointLight(55, 97, 55, 0, 0, 0);
    rotateZ(PI);
    translate(-76, -122, -64);
    scale(24);
    shape(vending);
    // glass pane
    translate(0.25, 0.91, 1.30);
    fill(177, 178);
    box(6.33, 1.43, 0.04);
    popMatrix();
     
   
    //spawn in dropped coins 
    //loop only the amount of coins spawned
    for (int i = 0; i<cs; i++) {
      //conditional statement to display which the value of the coin to spawn to random location
      if (moneyLeft[i] == 100) {
        pushMatrix();
        translate(spawnLocations[pick.get(i)].x, spawnLocations[pick.get(i)].y, spawnLocations[pick.get(i)].z);
        scale(24);
        shape(dollar);
        popMatrix();
      }
      if (moneyLeft[i] == 1) {
        pushMatrix();
        translate(spawnLocations[pick.get(i)].x, spawnLocations[pick.get(i)].y, spawnLocations[pick.get(i)].z);
        scale(24);
        shape(penny);
        popMatrix();
      }
      if (moneyLeft[i] == 10) {
        pushMatrix();
        translate(spawnLocations[pick.get(i)].x, spawnLocations[pick.get(i)].y, spawnLocations[pick.get(i)].z);
        scale(24);
        shape(silver);
        popMatrix();
      }
      if (moneyLeft[i] == 5) {
        pushMatrix();
        translate(spawnLocations[pick.get(i)].x, spawnLocations[pick.get(i)].y, spawnLocations[pick.get(i)].z);
        scale(24);
        shape(silver);
        popMatrix();
      }
      if (moneyLeft[i] == 25) {
        pushMatrix();
        translate(-5+spawnLocations[pick.get(i)].x, spawnLocations[pick.get(i)].y, spawnLocations[pick.get(i)].z);
        scale(24);
        shape(quarter);
        popMatrix();
      }
    }

    //snacks/drinks
    rotateZ(PI);
    //8 items in each row
    for (int j=0; j<8; j++) {
      //check quantities and types to show which snack/drink
      for (int i=0; i<row1[j][0]; i++) {
        if (row1[j][1]==0) {
          pushMatrix();
          translate(-44+j*15, -31.8, -54+i*-6);
          scale(24);
          shape(can);
          popMatrix();
        } else if (row1[j][1]==1) {
          pushMatrix();
          translate(-52+j*15, -31.8, -54+i*-6);
          scale(24);
          shape(water);
          popMatrix();
        } else if (row1[j][1]>1) {
          pushMatrix();
          translate(-33+j*15, -31.3, -54+i*-6);
          scale(24);
          shape(bag);
          popMatrix();
        }
      }

      for (int i=0; i<row2[j][0]; i++) {
        if (row2[j][1]==0) {
          pushMatrix();
          translate(-44+j*15, -31.8-30, -54+i*-6);
          scale(24);
          shape(can);
          popMatrix();
        } else if (row2[j][1]==1) {
          pushMatrix();
          translate(-52+j*15, -31.8-30, -54+i*-6);
          scale(24);
          shape(water);
          popMatrix();
        } else if (row2[j][1]>1) {
          pushMatrix();
          translate(-33+j*15, -31.3-30, -54+i*-6);
          scale(24);
          shape(bag);
          popMatrix();
        }
      }

      for (int i=0; i<row3[j][0]; i++) {
        if (row3[j][1]==0) {
          pushMatrix();
          translate(-44+j*15, -31.8-60, -54+i*-6);
          scale(24);
          shape(can);
          popMatrix();
        } else if (row3[j][1]==1) {
          pushMatrix();
          translate(-52+j*15, -31.8-60, -54+i*-6);
          scale(24);
          shape(water);
          popMatrix();
        } else if (row3[j][1]>1) {
          pushMatrix();
          translate(-33+j*15, -31.3-60, -54+i*-6);
          scale(24);
          shape(bag);
          popMatrix();
        }
      }

      for (int i=0; i<row4[j][0]; i++) {
        if (row1[j][1]==0) {
          pushMatrix();
          translate(-44+j*15, -31.8-90, -54+i*-6);
          scale(24);
          shape(can);
          popMatrix();
        } else if (row4[j][1]==1) {
          pushMatrix();
          translate(-52+j*15, -31.8-90, -54+i*-6);
          scale(24);
          shape(water);
          popMatrix();
        } else if (row4[j][1]>1) {
          pushMatrix();
          translate(-33+j*15, -31.3-90, -54+i*-6);
          scale(24);
          shape(bag);
          popMatrix();
        }
      }
    }
  }
}
