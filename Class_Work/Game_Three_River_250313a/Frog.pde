
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

  void jump() {
    if (keyPressed == true && key == 'w' && !jumpOnce) {
      jumpOnce = true;
      frogJump = true;
    } if (!keyPressed == true && jumpOnce) {
      jumpOnce = false;
      frogJump = false;
    }
  }


  void death(boolean playerDied) {
    if (playerDied) {
      sizeX -= 1;
      sizeY -= 1;
    }
  }
}
