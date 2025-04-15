//enum State {
//  SPAWN, STOP
//}

class FruitGenerator {
  //PROPERTIES
  PVector pos;
  float sizeX, sizeY;

  //CONTRUCTORS
  FruitGenerator(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
  }

  //METHODS
  void display() {
    pushMatrix();
    fill(255);
    rect(pos.x, pos.y, sizeX, sizeY);
    rectMode(CENTER);
    popMatrix();
  }

  void update() {
    //makes it go down
    pos.y += 1;
   
  }
}
