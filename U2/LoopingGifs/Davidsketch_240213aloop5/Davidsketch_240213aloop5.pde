//global variable for fonts
PFont[] fonts;
//code runs at start
void setup() {
  frameRate(30);
  //set size to 1000,1000
  size(1000, 1000);
  // frameRate(30);
  //declare pfont variable font array
  PFont[] font = {loadFont("ComicSansMS-Italic-48.vlw"),
    loadFont("Impact-48.vlw"),
    loadFont("SegoeScript-48.vlw"),
    loadFont("ChillerStd-48.vlw"),
    loadFont("InkFree-48.vlw"),
    loadFont("Papyrus-Regular-48.vlw"),
    loadFont("Impact-48.vlw"),
    loadFont("ComicSansMS-Italic-48.vlw"),
    loadFont("CurlzMT-48.vlw"),
    loadFont("Jokerman-Regular-48.vlw"),
    loadFont("Ravie-48.vlw"),
    loadFont("Broadway-48.vlw"),
    loadFont("Algerian-48.vlw"),
    loadFont("Impact-48.vlw"),
    loadFont("TradeGothicInline-Regular-48.vlw"),
    loadFont("ComicSansMS-Italic-48.vlw"),
    loadFont("ChillerStd-48.vlw"),
    loadFont("Algerian-48.vlw"),
    loadFont("MVBoli-48.vlw"),
    loadFont("SegoeScript-48.vlw"),
    loadFont("ChillerStd-48.vlw"),
    loadFont("TimesNewRomanPS-ItalicMT-48.vlw"),
    loadFont("Papyrus-Regular-48.vlw"),
    loadFont("Impact-48.vlw"),
    loadFont("ChillerStd-48.vlw"),
    loadFont("LatinWide-48.vlw"),
    loadFont("ComicSansMS-Italic-48.vlw"),
    loadFont("ComicSansMS-Italic-48.vlw"),
    loadFont("LatinWide-48.vlw"),
    loadFont("ComicSansMS-Italic-48.vlw"),
    loadFont("ChillerStd-48.vlw"),
    loadFont("TimesNewRomanPS-ItalicMT-48.vlw"),
    loadFont("Ravie-48.vlw")};
  //set background to black
  background(0);
  //asign the arry to global variable fonts
  fonts = font;
  //recreate the message at the start so it loops properly
  String word = "     GOING OFF ON A TANGENT";
  String[] array = word.split("");
  for (int i = 0; i < array.length; i++) {
    fill(i+100, 100+i * 9, 230);
    textFont(fonts[3], 20);
    text(array[i], i*20+150, 500+80*tan(frameCount/23.5 * i));
  }
}
//code runs every frame
void draw() {
  //make black square that fades in and out
  fill(0, 210*cos(2*frameCount/23.5));
  square(-100, -100, 9000);
  //the word thats going to be split into an array
  String word = "     GOING OFF ON A TANGENT";
  String[] array = word.split("");
  //for loop controlling loop over y
  for (int j = 0; j < 2; j+=900) {
    //for loop turns the word into a tangent wave and animated by framecount
    //change text fonts based on cosing wave mapped from 0 to 32
    //set fill using index of the loop
    for (int i = 0; i < array.length; i++) {
      fill(i+100, 100+i * 9, 230);
      textFont(fonts[int(map(cos(frameCount/23.5), -1, 1, 0, 32))], 20);
      text(array[i], i*20+150, 500+j+80*tan(frameCount/23.5 * i));
    }
  }
  //make background tangent wave with lots of dots
  for (float i = 0; i<1000; i+=0.5) {
    stroke(255, 255);
    point(0 + i, 500+-99*tan(i+frameCount/23.5));
  }
  //stop loop when framecount/23.5 is greater than pi * 4
  if (frameCount/23.5 > PI*4.0) {
    // noLoop();
  }
  //  saveFrame("frames/####.png");
}
