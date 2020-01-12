class Screen {
  int gameScreen = 0;
  int flag = 1;
  void initScreen() {
    background(236, 240, 241);
    textAlign(CENTER);
    fill(52, 73, 94);
    textSize(70);
    text("Flappy Pong", width/2, height/2);
    textSize(15); 
    text("The 1st round is a training. Click to start.", width/2, height-30);
  }
  void gameScreen() {
    background(236, 240, 241);
    r.drawRacket();
    r.watchRacketBounce();
    g.drawBall();
    b.applyGravity();
    b.applyHorizontalSpeed();
    b.keepInScreen();
    g.drawHealthBar();
    g.printScore();
    w.wallAdder();
    w.wallHandler();
  }
  void gameOverScreen() {
    background(44, 62, 80);
    textAlign(CENTER);
    fill(236, 240, 241);
    textSize(12);
    text("Your Score", width/2, height/2 - 120);
    textSize(130);
    text(g.score, width/2, height/2);
    textSize(15);
    text("Enter your name and Click to Restart", width/2, height-40);
    text("Enter 1~5 to save and continue to play", width/2, height-20);
    if(s.flag == 1) {
      n.inserttoMap(g.score);
      flag = 0;
    }
    n.i = 1;
    n.show();
  }
}
