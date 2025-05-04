//this class is an object that will follow a FruitGenerator
class Fish {
  //PROPERTIES
  PVector pos, heading;
  float sizeX, sizeY;
  float turnAmount;
  State currentState = State.IDLE;

  //CONTRUCTORS
  Fish(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
    heading = PVector.random2D();
  }

  //CONTRUCTORS
  void display() {
    pushMatrix();
    translate(pos.x, pos.y); //making this the origin point
    rotate(heading.heading());
    
    fill(100);
    rect(0, 0, sizeX, sizeY);
    triangle(0, - 20, - 20, 20, 20, 20);
    popMatrix();
  }

  void update() {
    heading.rotate(turnAmount);
  }
}
