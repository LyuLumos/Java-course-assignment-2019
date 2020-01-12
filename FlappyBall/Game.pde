class Game {
  int score;
  int maxHealth = 100;
  float health = 100;
  float healthDecrease = 2;
  int healthBarWidth = 60;
  // This method sets the necessery variables to start the game  
  void startGame() {
    s.gameScreen=1;
  }
  void gameOver() {
    s.gameScreen=2;
  }
  
  void restart(int n) {
    score = n;
    health = maxHealth;
    b.ballX=width/4;
    b.ballY=height/5;
    w.lastAddTime = 0;
    w.walls.clear();
    s.gameScreen = 1;
    s.flag = 1;
  }
  
  void drawBall() {
    fill(b.ballColor);
    ellipse(b.ballX, b.ballY, b.ballSize, b.ballSize);
  }
  
  void drawHealthBar() {
    noStroke();
    fill(189, 195, 199);
    rectMode(CORNER);
    rect(b.ballX-(healthBarWidth/2), b.ballY - 30, healthBarWidth, 5);
    if (health > 60) {
      fill(46, 204, 113);
    } else if (health > 30) {
      fill(230, 126, 34);
    } else {
      fill(231, 76, 60);
    }
    rectMode(CORNER);
    rect(b.ballX-(healthBarWidth/2), b.ballY - 30, healthBarWidth*(health/maxHealth), 5);
  }
  void decreaseHealth() {
    health -= healthDecrease;
    if (health <= 0) {
      gameOver();
    }
  }
  void score() {
    score++;
  }
  void printScore() {
    textAlign(CENTER);
    fill(0);
    textSize(30); 
    text(score, height/2, 50);
  }

}
