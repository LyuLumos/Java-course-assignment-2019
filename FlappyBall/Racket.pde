class Racket {
  color racketColor = color(0);
  float racketWidth = 100;
  float racketHeight = 10;
  void drawRacket() {
    fill(racketColor);
    rectMode(CENTER);
    rect(mouseX, mouseY, racketWidth, racketHeight, 5);
  }
  void watchRacketBounce() {
    float overhead = mouseY - pmouseY;
    if ((b.ballX+(b.ballSize/2) > mouseX-(racketWidth/2)) && (b.ballX-(b.ballSize/2) < mouseX+(racketWidth/2))) {
      if (dist(b.ballX, b.ballY, b.ballX, mouseY)<=(b.ballSize/2)+abs(overhead)) {
        b.makeBounceBottom(mouseY);
        b.ballSpeedHorizon = (b.ballX - mouseX)/10;
        // racket moving up
        if (overhead<0) {
          b.ballY+=(overhead/2);
          b.ballSpeedVert+=(overhead/2);
        }
      }
    }
  }
}
