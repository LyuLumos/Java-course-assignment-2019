class Wave {
  ArrayList<Circle> circles = new ArrayList<Circle>();
	int maxCircleNum;
	int maxRadius;
	int transSpeed;
	int speed;
	int firstDelay;
	int x, y;
	boolean isEnd;
	boolean forceStop;
  Wave() {}
	Wave(int x, int y, int maxCircleNum, int maxRadius, int speed, int firstDelay) {
		this.maxCircleNum = maxCircleNum;
		this.maxRadius = maxRadius;
		this.x = x;
		this.y = y;
		this.speed = speed;
		this.firstDelay = firstDelay;
		for (int i = 0; i < this.maxCircleNum; i++) {
			circles.add(new Circle(this.x, this.y, this.maxRadius, this.speed, this.firstDelay + (int)map(i, 0, this.maxCircleNum-1, 0, this.maxRadius/this.speed)));
		}
		this.isEnd = false;
		this.forceStop = false;
	}
  void setValue(int x, int y, int maxCircleNum, int maxRadius, int speed, int firstDelay) {
    this.maxCircleNum = maxCircleNum;
    this.maxRadius = maxRadius;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.firstDelay = firstDelay;
    for (int i = 0; i < this.maxCircleNum; i++) {
      circles.add(new Circle(this.x, this.y, this.maxRadius, this.speed, this.firstDelay + (int)map(i, 0, this.maxCircleNum-1, 0, this.maxRadius/this.speed)));
    }
    this.isEnd = false;
    this.forceStop = false;
  }

	void update() {
		for (int i = 0; i < this.maxCircleNum; i++) 
			circles.get(i).update();
		this.isEnd = circles.get(maxCircleNum - 1).isEnd;
	}

	void show() {
		for (int i = 0; i < this.maxCircleNum; i++)
			circles.get(i).show();
	}

	void setNewPoint(int x, int y) {
		this.x = x;
		this.y = y;
		for (int i = 0; i < this.maxCircleNum; i++)
			circles.get(i).setNewPoint(x, y);
	}
}
