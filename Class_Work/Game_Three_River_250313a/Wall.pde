class Wall {
  //PROPERTIES
  PVector pos, movementSpeed;
  float sizeX, sizeY;
  float frogJumpAmount = 10;

  //CONTRUCTORS
  Wall(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    movementSpeed = new PVector(10,0);
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

  void update(boolean frogJump) {//Its game loop i swear
    if (frogJump) {
      pos.y += frogJumpAmount;

      // Reset the wall to the top
      if (pos.y >= height + 60) {
        pos.y = -20;
      }
    }

    //makes the smaller walls move side to side
    if (sizeX != width) {
      pos.add(movementSpeed);
    }

    if (pos.x- sizeX / 2 <= -5 || pos.x+ sizeX/2 >= width + 5) {
      movementSpeed.x *= -1;
    }
  }
}
