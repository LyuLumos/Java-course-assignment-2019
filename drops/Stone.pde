class Stone {
  int x, y, radius;
  int delta;
  int init() {
    if(mousePressed) {
      this.x = mouseX;
      this.y = mouseY;
      return 1;
    }
    return 0;
  }
  void run() {
    this.radius = 10;
    this.show();
  }
  void show() {
    fill(255, 255, 255);
    stroke(255);
    ellipse(x, y, radius + delta, radius + delta);
  }
  void spread() {
    delta += 2;
  }
}
