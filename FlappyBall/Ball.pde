class Ball {
  float ballX, ballY;
  float ballSpeedVert = 0;
  float ballSpeedHorizon = 0;
  float ballSize = 20;
  color ballColor = color(0);
  void applyGravity() {
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
  ballSpeedVert -= (ballSpeedVert * airfriction);
  }
  void applyHorizontalSpeed() {
    ballX += ballSpeedHorizon;
    ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
  }
  // ball falls and hits the floor (or other surface) 
  void makeBounceBottom(float surface) {
    ballY = surface-(ballSize/2);
    ballSpeedVert*=-1;
    ballSpeedVert -= (ballSpeedVert * friction);
  }
  // ball rises and hits the ceiling (or other surface)
  void makeBounceTop(float surface) {
    ballY = surface+(ballSize/2);
    ballSpeedVert*=-1;
    ballSpeedVert -= (ballSpeedVert * friction);
  }
  // ball hits object from left side
  void makeBounceLeft(float surface) {
    ballX = surface+(ballSize/2);
    ballSpeedHorizon*=-1;
    ballSpeedHorizon -= (ballSpeedHorizon * friction);
  }
  // ball hits object from right side
  void makeBounceRight(float surface) {
    ballX = surface-(ballSize/2);
    ballSpeedHorizon*=-1;
    ballSpeedHorizon -= (ballSpeedHorizon * friction);
  }
  // keep ball in the screen
  void keepInScreen() {
    // ball hits floor
    if (ballY+(ballSize/2) > height) { 
      makeBounceBottom(height);
    }
    // ball hits ceiling
    if (ballY-(ballSize/2) < 0) {
      makeBounceTop(0);
    }
    // ball hits left of the screen
    if (ballX-(ballSize/2) < 0) {
      makeBounceLeft(0);
    }
    // ball hits right of the screen
    if (ballX+(ballSize/2) > width) {
      makeBounceRight(width);
    }
  }
}
