//inspired by truism by jenny holzer
PFont[] fonts;
//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000);
 // frameRate(30);
  //declare pfont variable font
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
     background(0);

  fonts = font;
    String word = "     GOING OFF ON A TANGENT";
  String[] array = word.split("");
    for (int i = 0; i < array.length; i++) {
      fill(i+100, 100+i * 9, 230);
      textFont(fonts[3], 20);
      text(array[i], i*20+150, 500+80*tan(frameCount/25.23456 * i));
    }
 
 
  //asign font i created to font variable
  //font[]
  //set text font to font variable and size to 20
}
//code runs every frame
void draw() {
  
  fill(0,210*cos(2*frameCount/25.23456));
  square(0,0,9000);
  //set background to black
  //write the quote from truism
  String word = "     GOING OFF ON A TANGENT";
  String[] array = word.split("");
  for (int j = 0; j < 2; j+=900) {
    for (int i = 0; i < array.length; i++) {
      fill(i+100, 100+i * 9, 230);
      textFont(fonts[int(map(cos(frameCount/25.23456), -1, 1, 0, 32))], 20);
      text(array[i], i*20+150, 500+j+80*tan(frameCount/25.23456 * i));
    }
  }
   for (float i = 0; i<1000; i+=0.5) {
        stroke(255, 255);
        point(0 + i, 500+-99*tan(i+frameCount/25.23456));
      }
   // noLoop();

  if(frameCount/25.23456 > PI*4.0){
  //  noLoop();
  }
 // saveFrame("frames/####.png");
}
//code runs when mouse pressed
void mousePressed() {
  //save file as png
  save(this + ".png");
}
