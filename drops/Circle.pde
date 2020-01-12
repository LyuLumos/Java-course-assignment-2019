class Circle {
	int radius;
	int maxRadius;
	int speed;
	int transparent;
	int x, y, nx, ny;
	int firstDelay;
	boolean isEnd;
	Circle(int x, int y, int maxRadius, int speed, int firstDelay) {
		this.maxRadius = maxRadius;
		this.radius = 0;
		this.speed = speed;
		this.transparent = 255;
		this.nx = this.x = x;
		this.ny = this.y = y;
		this.firstDelay = firstDelay;
		this.isEnd = false;
	}

	void update() {
		if (isEnd) return;
		if (this.firstDelay > 0) {
			this.firstDelay--;
			return;
		}
		this.radius += this.speed;
		this.transparent = (int)map(this.radius, 0, this.maxRadius, 255, 0);
		if (this.radius >= maxRadius) {
			this.isEnd = true;
		}
	}

	void show() {
		if (firstDelay > 0 || isEnd) return;
		fill(255, 0);
		stroke(255, transparent);
		ellipse(this.x, this.y, radius, radius);
	}

	void setNewPoint(int x, int y) {
		this.nx = x;
		this.ny = y;
	}
} 
