class Control {
	int n;
  Control() {
    n = 10;
  }
  void getKeyboard() {
    if (keyPressed && (key == CODED)) {
      if(keyCode == UP) this.n = 20;
      else if(keyCode == DOWN) this.n = 1;
    }
    System.out.println("speed = " + n);
  }
}
