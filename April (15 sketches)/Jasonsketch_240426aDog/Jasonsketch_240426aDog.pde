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
int start = 0;
int end = 1300;
void draw() {
  background(0);
  textSize(40);
  text("IN LOVING MEMORY TO THOSE PEOPLE BITED \nBY A DOG  IN NEW YORK", 25, 90);
  image(dateDog, 50+437+15*cos(control/20.019), 29, 168, 220);
  image(skull, 60+312, 101+15*sin(control/20.019), 179, 101);
  control-=4.0293;


  println(end);

  textSize(15);

  if (control<-400000) {
    start = 1300;
      control-=100.0293;

    end = dog.getJSONArray("data").size();
  }

translate(control, 0);
for (int i = start; i<end; i++) {
  //date
  text("AAH DOG BITED!", 100+i*300, 350);
  text(dog.getJSONArray("data").getJSONArray(i).getString(9), 100+i*300, 400
    );
  //breed
  if (dog.getJSONArray("data").getJSONArray(i).isNull(11)) {
    text("Unkown breed", 100+i*300, 450
      );
  } else {
    text("Dog Breed: "+dog.getJSONArray("data").getJSONArray(i).getString(11), 100+i*300, 450
      );
  }
  //borough
  text(dog.getJSONArray("data").getJSONArray(i).getString(15), 100+i*300, 500
    );
}
text("THE END! THATS ALL FOLKS", 100+dog.getJSONArray("data").size()*300, 350);

}
