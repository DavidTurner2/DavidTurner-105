//inspired by truism by jenny holzer
PFont[] fonts;
//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000);
  
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
  fonts = font;
  //asign font i created to font variable
  //font[]
  //set text font to font variable and size to 20
}
//code runs every frame
void draw() {
  //set background to black
  background(0);
  //write the quote from truism
  String word = "     GOING OFF ON A TANGENT";
  String[] array = word.split("");
  for (int j = 0; j < 1100; j+=100) {
    for (int i = 0; i < array.length; i++) {
      fill(i+100, 100+i * 9, 230);
      textFont(fonts[int(map(sin(frameCount/25.23456), -1, 1, 0, 32))], 20);
      text(array[i], i*20+150, j+80*tan(frameCount/25.23456 * i));
    }
  }

  if(frameCount/25.23456 > TAU*2.0){
    noLoop();
  }
 // saveFrame("frames/####.png");
}
//code runs when mouse pressed
void mousePressed() {
  //save file as png
  save(this + ".png");
}
