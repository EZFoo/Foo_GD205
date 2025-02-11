//https://github.com/mrfb/gd105-fall24/blob/main/Lecture%20Code/lecture_241113a_car/car.pde
class Tank {
  // PROPERTIES
  PVector pos, heading, tankGun;
  float speed;

  // CONTRUCTORS
 //Overload
  Tank() {
    pos = new PVector(random(50, width - 50), random(50, height - 50));
    speed = 0;
    heading = PVector.random2D();
    tankGun = new PVector(pos.x + 10, pos.y + 10);
  }

  // METHODS

  // draw the Tank at its current position
  void display(color a) {
    //using push/pop matrix because the transformation is affecting other objects
    pushMatrix();
    rectMode(CENTER);
    fill(a);
    translate(pos.x, pos.y);
    rotate(heading.heading());
    rect(0, 0, 40, 40, 10);
    noStroke();
    rect(18, 0, 40, 15);
    popMatrix();
  }

  // update the position and state of the Tank based on inputs
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
      speed = +1;
    } else if (keyPressed && key == 's') {
      speed = -1;
    }

    pos.add(PVector.mult(heading, speed));
  }

  void turn(float turnAmount) {
    heading.rotate(turnAmount);
  }
}
