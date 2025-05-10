//this class is an object that will follow a FruitGenerator
class Fish {
  //PROPERTIES
  PVector pos, heading;
  PVector idleTarget;
  float sizeX, sizeY;
  float turnAmount;
  float hunger = TAU;
  float growth = 0;
  State currentState = State.IDLE;

  //CONTRUCTORS
  Fish(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
    heading = PVector.random2D();
    idleTarget = new PVector(random(width), random(height));
  }

  //CONTRUCTORS
  void display() {
    pushMatrix();
    translate(pos.x, pos.y); //making this the origin point
    rotate(heading.heading());
    scale(0.5 + growth, 0.5 + growth);
    fill(100);
    stroke(0);
    rect(-5, 0, sizeX, sizeY);
    triangle(-20, - 20, - 20, 20, 20, 0);
    noFill();
    stroke(255);
    arc(0, 0, 30, 30, 0, hunger);
    popMatrix();
  }

  void update() {
    heading.rotate(turnAmount);

    //the fish will get
    growth = constrain(growth, 0.5, 1.5);
    hunger = constrain(hunger, 0, TAU);
    hunger -= TAU * 0.005;

    if (hunger > 0) {
      growth += 0.001;
    }
  }
}
