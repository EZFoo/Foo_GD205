class Bullet {
  // PROPERTIES
  PVector startPos, velocity;
  float size;

  // CONSTRUCTORS
  Bullet(float x, float y, int s, float vx, float vy) {
    startPos = new PVector(x, y);
    size = s;
    velocity = new PVector(vx * 2, vy * 2);
  }

  // METHODS

  void display() {
    //using push/pop matrix because the transformation is affecting other objects
    pushMatrix();
    noStroke();
    fill(255, 0, 0);
    ellipse(startPos.x, startPos.y, size, size);
    popMatrix();
  }

  void update() {
    //The speed of the bullet

    startPos.add(velocity);
  }
}
