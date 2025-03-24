class Wall {
  //PROPERTIES
  PVector pos, startPos, movementSpeed;
  float sizeX, sizeY;
  float frogJumpAmount = 20;
  boolean doOnce = true;

  //CONTRUCTORS
  Wall(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    startPos = new PVector(x, y);
    movementSpeed = new PVector(2, 0);
    sizeX = scaleX;
    sizeY = scaleY;
  }

  //METHODS
  void display() {
    pushMatrix();
    fill(#01012b);
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
      
      //adds a random starting pos
      if (doOnce) {
        pos.x = (startPos.x + random(-290, 290));
        doOnce = false;
      }
    }

    if (pos.x - sizeX / 2 <= -5 || pos.x+ sizeX/2 >= width + 5) {
      movementSpeed.x *= -1;
    }
  }

  void frogDied(boolean frogDied, boolean respawn) {
    if (frogDied) {
      pos = startPos;
    } if (respawn) {
      doOnce = true;
    }
  }
}
