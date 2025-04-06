class Fish {
  //PROPERTIES
  PVector pos, heading;
  float sizeX, sizeY;

  //CONTRUCTORS
  Fish(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
  }

  //METHODS
  void display() {
    pushMatrix();
    fill(100);
    rect(pos.x, pos.y, sizeX, sizeY);
    rectMode(CENTER);
    popMatrix();
  }

  void update(FruitGenerator one) {

    if (pos.x < one.pos.x) {
      pos.x += 10;
    } else if (pos.x > one.pos.x) {
      pos.x -= 10;
    }

    if (pos.y < one.pos.y) {
      pos.y += 10;
    } else if (pos.y > one.pos.y) {
      pos.y -= 10;
    }
  }
}
