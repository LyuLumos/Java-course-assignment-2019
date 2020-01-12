class TextBox {
  int xLoc;
  int yLoc;
  
  String label = "Name: ";
  String letters = "";

  int back = 102;

  void draw() {
    PFont font = createFont("Georgia Bold Italic", 20);
    fill(255);
    stroke(255);
    textFont(font);
    text(label+letters, 100, 400);
  }
  
  void commandParse() {
    println(key);
    if ((key == ENTER) || (key == RETURN)) {
      playername = letters;
      println(letters);
      letters = ""; // Clear the variable
    } else if ((key > 31) && (key != CODED)) {
      // If the key is alphanumeric, add it to the String
      letters = letters + key;
    }
    if (key == BACKSPACE) {
      if (letters.length() > 0) {
        letters = letters.substring(0, letters.length()-1);
      }
    }
  }
}
