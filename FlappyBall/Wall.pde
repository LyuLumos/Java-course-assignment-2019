class Wall {
  int wallSpeed = 5;
  int wallInterval = 1000;
  float lastAddTime = 0;
  int minGapHeight = 200;
  int maxGapHeight = 300;
  int wallWidth = 80;
  color wallColors = color(44, 62, 80);
  ArrayList<int[]> walls = new ArrayList<int[]>();
  
  void wallAdder() {
  if (millis()-lastAddTime > wallInterval) {
    int randHeight = round(random(minGapHeight, maxGapHeight));
    int randY = round(random(0, height-randHeight));
    // {gapWallX, gapWallY, gapWallWidth, gapWallHeight, scored}
    int[] randWall = {width, randY, wallWidth, randHeight, 0}; 
    walls.add(randWall);
    lastAddTime = millis();
  }
  }
  void wallHandler() {
    for (int i = 0; i < walls.size(); i++) {
      wallRemover(i);
      wallMover(i);
      wallDrawer(i);
      watchWallCollision(i);
    }
  }
  void wallDrawer(int index) {
    int[] wall = walls.get(index);
    // get gap wall settings 
    int gapWallX = wall[0];
    int gapWallY = wall[1];
    int gapWallWidth = wall[2];
    int gapWallHeight = wall[3];
    // draw actual walls
    rectMode(CORNER);
    noStroke();
    strokeCap(ROUND);
    fill(wallColors);
    rect(gapWallX, 0, gapWallWidth, gapWallY, 0, 0, 15, 15);
    rect(gapWallX, gapWallY+gapWallHeight, gapWallWidth, height-(gapWallY+gapWallHeight), 15, 15, 0, 0);
  }
  void wallMover(int index) {
    int[] wall = walls.get(index);
    wall[0] -= wallSpeed;
  }
  void wallRemover(int index) {
    int[] wall = walls.get(index);
    if (wall[0]+wall[2] <= 0) {
      walls.remove(index);
    }
  }
  
  void watchWallCollision(int index) {
    int[] wall = walls.get(index);
    // get gap wall settings 
    int gapWallX = wall[0];
    int gapWallY = wall[1];
    int gapWallWidth = wall[2];
    int gapWallHeight = wall[3];
    int wallScored = wall[4];
    int wallTopX = gapWallX;
    int wallTopY = 0;
    int wallTopWidth = gapWallWidth;
    int wallTopHeight = gapWallY;
    int wallBottomX = gapWallX;
    int wallBottomY = gapWallY+gapWallHeight;
    int wallBottomWidth = gapWallWidth;
    int wallBottomHeight = height-(gapWallY+gapWallHeight);
  
    if (
      (b.ballX+(b.ballSize/2)>wallTopX) &&
      (b.ballX-(b.ballSize/2)<wallTopX+wallTopWidth) &&
      (b.ballY+(b.ballSize/2)>wallTopY) &&
      (b.ballY-(b.ballSize/2)<wallTopY+wallTopHeight)
      ) {
      g.decreaseHealth();
    }
    if (
      (b.ballX+(b.ballSize/2)>wallBottomX) &&
      (b.ballX-(b.ballSize/2)<wallBottomX+wallBottomWidth) &&
      (b.ballY+(b.ballSize/2)>wallBottomY) &&
      (b.ballY-(b.ballSize/2)<wallBottomY+wallBottomHeight)
      ) {
      g.decreaseHealth();
    }
  
    if (b.ballX > gapWallX+(gapWallWidth/2) && wallScored==0) {
      wallScored=1;
      wall[4]=1;
      g.score();
    }
  }

}
