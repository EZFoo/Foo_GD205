class Bullet {
  // PROPERTIES
  PVector startPos, velocity;
  float size;

  // CONSTRUCTORS
  Bullet(float x, float y, int s, float vx, float vy) {
    startPos = new PVector(x, y);
    size = s;
    //The speed of the bullet
    velocity = new PVector(vx * 6, vy * 6);
  }

  // METHODS

  void display(color bulletColor) {
    //using push/pop matrix because the transformation is affecting other objects
    pushMatrix();
    noStroke();
    fill(bulletColor);
    ellipse(startPos.x, startPos.y, size, size);
    popMatrix();
  }

  void update() {
    //The speed of the bullet
    startPos.add(velocity);
  }

//collision with a bullet and a tank
boolean bulletHitTank (Tank tankName) {
    if ((startPos.x - size / 2 <= tankName.pos.x + tankName.hitBoxWidth / 2) &&
      (startPos.x + size / 2 >= tankName.pos.x - tankName.hitBoxWidth / 2) &&
      (startPos.y - size / 2 <= tankName.pos.y + tankName.hitBoxHeight / 2) &&
      (startPos.y + size / 2 >= tankName.pos.y - tankName.hitBoxHeight / 2)) {
      return true;
    }
    return false;
  }
}
