
class Frog {
  //PROPERTIES
  PVector pos;
  boolean jumpOnce = false, frogJump = false;
  float sizeX, sizeY;

  //CONTRUCTORS
  Frog(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
  }

  //METHODS
  void display() {
    pushMatrix();
    rectMode(CENTER);
    rect(pos.x, pos.y, sizeX, sizeY);
    popMatrix();
  }
//another bad attempt at a state machine 
  void jump() {
    if (keyPressed && key == 'w' && !jumpOnce) {
      jumpOnce = true;
      frogJump = true;
    } else if (!keyPressed && key == 'w' && jumpOnce) {
      jumpOnce = false;
      frogJump = false;
    }
  }


  void death(boolean playerDied) {
    if (playerDied && sizeY > 0 && sizeX > 0) {
      sizeX -= 1;
      sizeY -= 1;
    }
  }
}
