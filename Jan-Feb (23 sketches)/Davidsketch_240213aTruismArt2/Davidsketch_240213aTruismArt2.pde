//inspired by truism by jenny holzer
//code runs at start
void setup(){
    //set size to 1000,1000
 size(1000,1000); 
   //declare pfont array variable font and assign fonts in an array
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
loadFont("Algerian-48.vlw"),
loadFont("TradeGothicInline-Regular-48.vlw"),
loadFont("Algerian-48.vlw"),
loadFont("MVBoli-48.vlw"),
loadFont("SegoeScript-48.vlw"),
loadFont("ChillerStd-48.vlw"),
loadFont("TimesNewRomanPS-ItalicMT-48.vlw"),
loadFont("Papyrus-Regular-48.vlw"),
loadFont("Impact-48.vlw"),
loadFont("LatinWide-48.vlw"),
loadFont("ChillerStd-48.vlw"),
loadFont("ComicSansMS-Italic-48.vlw"),
loadFont("ComicSansMS-Italic-48.vlw"),
loadFont("Papyrus-Regular-48.vlw"),
loadFont("ComicSansMS-Italic-48.vlw"),
loadFont("ChillerStd-48.vlw"),
loadFont("TimesNewRomanPS-ItalicMT-48.vlw"),
loadFont("Ravie-48.vlw")};
//run assign function using the variable i just created
assign(font);   
}
//create global variable
PFont[] fonts;
//code runs every frame
void draw(){
  //set background to black
  background(0);  
  //write the quote from truism save it as a string
  String word = "BOREDOM MAKES YOU DO CRAZY THINGS";
  //split the string
  String[] array = word.split("");
  //loop that duplicates the words
  for(int j = 0; j < 1100; j+=100){
    //loop that takes the characters of the word and makes it into a sine wave and make a color gradient
  for (int i = 0; i < array.length; i++){
    //color gradient
    fill(230,i * 9,i * 12);
    //change fonts and size to 20
   textFont(fonts[i],20);
//make characters of word into sin wave
  text(array[i],i*20+150,j+80*sin(i * PI/12));
  }
  }
}
//function that takes pfont array parameter and assign it to the global variable i creatd
void assign(PFont[] y){
  fonts = y;
}
//code runs when mouse pressed
void mousePressed(){
 //save file as png
 save(this + ".png");
}
