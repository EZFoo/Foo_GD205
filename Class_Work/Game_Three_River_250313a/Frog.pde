enum State {
  IDLE, JUMPING, DEAD, RESPAWN
}

class Frog {
  //PROPERTIES
  PVector pos, startPos;
  boolean jumpOnce = false, frogJump = false;
  float sizeX, sizeY, startSizeX, startSizeY;


  State currentState = State.IDLE;

  //CONTRUCTORS
  Frog(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    startPos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
    startSizeX = scaleX;
    startSizeY = scaleY;
  }

  //METHODS
  void display() {
    pushMatrix();
    fill(#d1f7ff);
    rectMode(CENTER);
    rect(pos.x, pos.y, sizeX, sizeY);
    popMatrix();
  }
  //another bad attempt at a state
  void jump() {
    switch (currentState) {
    case IDLE:
      frogJump = false;
      break;

    case JUMPING:
      frogJump = true;
      currentState = State.IDLE;
      break;

    case DEAD:
      sizeX = startSizeX;
      sizeY = startSizeY;
      currentState = State.RESPAWN;
      break;

    case RESPAWN:
      currentState = State.IDLE;
      pos = startPos;
      break;
    }


    if (!keyPressed && key == 'w' && !jumpOnce) {
      currentState = State.JUMPING;
      jumpOnce = true;
    }
    if (keyPressed && key == 'w' && jumpOnce) {
      jumpOnce = false;
    }
  }

  void death(boolean playerDied) {
    if (playerDied && sizeY > 0 && sizeX > 0) {
      sizeX -= 1;
      sizeY -= 1;
    }

    if (sizeY <= 0 && sizeX <= 0) {
      currentState = State.DEAD;
    }
  }
}
