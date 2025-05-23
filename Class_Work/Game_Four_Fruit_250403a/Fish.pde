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

  //prototype
  Fish clone() {
    Fish copy = new Fish(pos.x, pos.y, sizeX, sizeY);
    copy.heading = heading.copy();
    copy.idleTarget = idleTarget.copy();
    copy.hunger = hunger;
    copy.growth = growth;
    copy.currentState = currentState;
    return copy;
  }

  //METHODS
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

    growth = constrain(growth, 0.5, 1.5);
    hunger = constrain(hunger, 0, TAU);
    hunger -= TAU * 0.002;

    if (hunger > 0) {
      growth += 0.0005;
      // Generate money when full
      if (frameCount % 60 == 0) {
        gameUI.money += 2;
      }
    }
  }
}
