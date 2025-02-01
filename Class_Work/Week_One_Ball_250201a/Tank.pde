//https://github.com/mrfb/gd105-fall24/blob/main/Lecture%20Code/lecture_241113a_car/car.pde
class Tank {
  // PROPERTIES
  PVector pos;
  float speed;
  PVector heading;

  // CONTRUCTORS
  Tank() {
    pos = new PVector(random(width), random(width));
    speed = 0;
    heading = PVector.random2D();
  }

  Tank(float x, float y) {
    pos = new PVector(x, y);
    speed = 0;
    heading = PVector.random2D();
  }

  // METHODS

  // draw the Tank at its current position
  void display() {
    rectMode(CENTER);
    translate(pos.x, pos.y);
    rotate(heading.heading());
    rect(0, 0, 50, 50, 10);
    noStroke();
    rect(10, 0, 70, 10);
  }

  // update the position and state of the Tank
  // based on inputs
  void update() {
    // handle turning
    if (keyPressed && key == 'a') {
      turn(- TAU / 360.0);
    } else if (keyPressed && key == 'd') {
      turn(+ TAU / 360.0);
    } else {
      turn(0);
    }

    if (keyPressed && key == 'w') {
      speed = 2;
    } else if (keyPressed && key == 's') {
      speed = -2;
    } else {
      speed = 0;
    }

    pos.add(PVector.mult(heading, speed));
  }

  void turn(float turnAmount) {
    heading.rotate(turnAmount);
  }
}
