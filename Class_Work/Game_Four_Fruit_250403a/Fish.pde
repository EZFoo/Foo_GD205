class Fish {
  //PROPERTIES
  PVector pos;
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

  void update() {
  }
}
