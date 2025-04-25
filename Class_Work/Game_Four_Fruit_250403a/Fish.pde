//this class is an object that will follow a FruitGenerator
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

  //CONTRUCTORS
  void display() {
    fill(100);
    rect(pos.x, pos.y, sizeX, sizeY);
  }

  void update() {
    
  }
}
