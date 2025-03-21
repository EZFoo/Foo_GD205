class Wall {
  //PROPERTIES
  PVector pos;
  float sizeX, sizeY;
  float frogJumpAmount = 0;

  //CONTRUCTORS
  Wall(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
  }

  //METHODS
  void display() {
    pushMatrix();
    fill(#6300ff);
    rectMode(CENTER);
    rect(pos.x, pos.y, sizeX, sizeY);
    popMatrix();
  }

  void update(boolean frogJump) {
    if (frogJump) {
      frogJumpAmount += 10;

      pos.y += frogJumpAmount;

      // Reset the wall to the top
      if (pos.y >= height + 20) {
        pos.y = -sizeY;
        frogJumpAmount = 0;
      }
    }
  }
}
