class Bullet {
  // PROPERTIES
  PVector startPos, velocity;
  float size;

  // CONSTRUCTORS
  Bullet(float x, float y, int s) {
    startPos = new PVector(x, y);
    size = s;
    velocity = new PVector(0.5, 0.5);
  }

  // METHODS

  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(startPos.x, startPos.y, size, size);
  }

  void update() {
  startPos.add(velocity);
  }
}
