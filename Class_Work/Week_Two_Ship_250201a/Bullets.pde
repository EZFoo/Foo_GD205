class Bullet {
  // PROPERTIES
  PVector startPos, velocity;
  float size;

  // CONSTRUCTORS
  Bullet(float x, float y, int s, float vx, float vy) {
    startPos = new PVector(x, y);
    size = s;
    velocity = new PVector(vx * 5, vy * 5);
  }

  // METHODS

  void display() {
    //using push/pop matrix because the transformation is affecting other objects
    pushMatrix();
    noStroke();
    fill(#ff008d);
    ellipse(startPos.x, startPos.y, size, size);
    popMatrix();
  }

  void update() {
    //The speed of the bullet

    startPos.add(velocity);
  }
}
