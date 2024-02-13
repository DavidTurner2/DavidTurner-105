//inspired by truism by jenny holzer
//code runs at start
void setup(){
    //set size to 1000,1000
 size(1000,1000); 
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
assign(font);
   //asign font i created to font variable
  //font[] 
   //set text font to font variable and size to 20
}
PFont[] fonts;
//code runs every frame
void draw(){
  //set background to black
  background(0);  
  //write the quote from truism
  String word = " BOREDOM MAKES YOU DO CRAZY THINGS";
  String[] array = word.split("");
  for(int j = 0; j < 1100; j+=100){
  for (int i = 0; i < array.length; i++){
    fill(230,i * 9,i * 12);
   textFont(fonts[int(random(0,32))],20);

  text(array[i],i*20+150,j+80*1/cos(frameCount/240.23456 * i * PI/12));
  }
  }
}

void assign(PFont[] y){
  fonts = y;
}
//code runs when mouse pressed
void mousePressed(){
 //save file as png
 save(this + ".png");
}
