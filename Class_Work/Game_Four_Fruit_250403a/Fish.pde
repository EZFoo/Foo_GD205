//this class is an object that will follow a FruitGenerator

enum State {
  IDLE, FEEDING
}

class Fish {
  //PROPERTIES
  PVector pos, heading;
  float sizeX, sizeY;
  State currentState = State.IDLE;

  //CONTRUCTORS
  Fish(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
  }

  //CONTRUCTORS
  void display() {
    pushMatrix();
    rectMode(CENTER);
    fill(100);
    rect(pos.x, pos.y, sizeX, sizeY);
    popMatrix();
  }

  void update(FruitGenerator one) {
    switch(currentState) {
    case FEEDING:
      if (pos.x < one.pos.x && one.pos.y < height - one.sizeY) {
        pos.x += random(3);
      } else if (pos.x > one.pos.x && one.pos.y < height - one.sizeY) {
        pos.x -= random(3);
      }

      if (pos.y < one.pos.y && one.pos.y < height - one.sizeY) {
        pos.y += random(3);
      } else if (pos.y > one.pos.y && one.pos.y < height - one.sizeY) {
        pos.y -= random(3);
        break;
      }

    case IDLE:
      pos.x += random(-1, 1);
      pos.y += random(-1, 1);
      break;
    }
  }
}
