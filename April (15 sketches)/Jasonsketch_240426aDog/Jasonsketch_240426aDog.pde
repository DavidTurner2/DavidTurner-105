JSONObject dog;
PImage dateDog;
PImage skull;

void setup() {
  size(800, 800);
  dog = loadJSONObject("DOG.JSON");
  dateDog = loadImage("dog-face.png");
  skull = loadImage("skull.png");
}
float control =0;
Text scroll = new Text();
void draw() {
  background(0);
  textSize(40);
  text("IN LOVING MEMORY TO THOSE PEOPLE BITED \nBY A DOG  IN NEW YORK", 25, 90);
  image(dateDog, 50+437+15*cos(control/50.019), 29, 168, 220);
  image(skull, 60+312, 101+15*sin(control/50.019), 179, 101);
  control-=4.0293;


  println(dog.getJSONArray("data").size());

  textSize(15);
  scroll.update();


  //translate(control, 0);
}

class Text {
  int j[] = new int[4];
  PVector date[] = new PVector[4];
  PVector f = new PVector(100+3*300-200, 400);

  float prev[] = new float[4];
  PVector teleport = new PVector(-400, 0);
  Text() {

    for (int i = 0; i<4; i++) {
      date[i] = new PVector(100+i*300, 400);
      j[i] = i;
      prev[i] = date[i].x;
    }
  }
  void update() {
    for (int i = 0; i<4; i++) {
      if (j[i]<26127) {
        //text(dog.getJSONArray("data").getJSONArray(j[i]).getString(8), date[i].x, date[i].y-100);

        text("AAH DOG BITED!", date[i].x, date[i].y-50);
        text(dog.getJSONArray("data").getJSONArray(j[i]).getString(9), date[i].x, date[i].y);
        if (dog.getJSONArray("data").getJSONArray(j[i]).isNull(11)) {
          text("Dog Breed: UNKNOWN", date[i].x, date[i].y+50
            );
        } else {
          text("Dog Breed: "+dog.getJSONArray("data").getJSONArray(j[i]).getString(11), date[i].x, date[i].y+50
            );
        }
        //borough
        text(dog.getJSONArray("data").getJSONArray(j[i]).getString(15), date[i].x, date[i].y+100
          );

        //scrolling
        date[i].add(-3, 0);


        if (date[i].x <teleport.x) {
          j[i]+=4;
          date[i].x = date[i].x+1200;
        }
      } else {
        if(i==0){
        f.add(-1.2, 0);
        }
        text("The end!", f.x, f.y-50);
      }
    }
  }
}
