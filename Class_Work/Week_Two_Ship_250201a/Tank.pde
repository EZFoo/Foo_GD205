//https://github.com/mrfb/gd105-fall24/blob/main/Lecture%20Code/lecture_241113a_car/car.pde
class Tank {
  // PROPERTIES
  PVector pos, heading, tankGun;
  float speed, hitBoxWidth = 30, hitBoxHeight = 40;

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
    triangle(30, 15, -14, 16, -30, 50);
    triangle(30, -15, -14, -16, -30, -50);
    rect(0, 0, 30, 40);
    noFill();
    stroke(10);
    rect(0, 0, hitBoxWidth, hitBoxHeight);
    noStroke();
    popMatrix();
  }

  // update the position and state of the Tank based on inputs
  void update() {
    // handle turning
    if (keyPressed && key == 'a') {
      turn(- TAU * 2 / 360.0);
    } else if (keyPressed && key == 'd') {
      turn(+ TAU * 2/ 360.0);
    } else {
      turn(0);
    }

    if (keyPressed && key == 'w') {
      speed = min(speed+1.0, 5.0);
    } else if (keyPressed && key == 's') {
      speed = max(speed- 0.5, -5);
    }

    pos.add(PVector.mult(heading, speed));
  }

  void turn(float turnAmount) {
    heading.rotate(turnAmount);
  }

  //checks if tank is hitting a wall
  boolean tankHitWall (Wall wallName) {
    if ((pos.x - hitBoxWidth / 2 <= wallName.wallPos.x + wallName.rectScaleX / 2) &&
      (pos.x + hitBoxWidth / 2 >= wallName.wallPos.x - wallName.rectScaleX / 2) &&
      (pos.y - hitBoxHeight / 2 <= wallName.wallPos.y + wallName.rectScaleY / 2) &&
      (pos.y + hitBoxHeight / 2 >= wallName.wallPos.y - wallName.rectScaleY / 2)) {
      return true;
    }
    return false;
  }

  void tankStopHitWall (boolean tankHitWall, Wall wallName) {
    if (tankHitWall) {
      
      if (pos.x > wallName.wallPos.x - wallName.rectScaleX / 2 && //This checks if the player is to the left wall
        pos.x < wallName.wallPos.x + wallName.rectScaleX / 2) {//This checks if the player ia to the right of the wall
        speed *= -1;
      }
      if (pos.y > wallName.wallPos.y - wallName.rectScaleY / 2 &&
        pos.y < wallName.wallPos.y + wallName.rectScaleY / 2) {
        speed *= -1;
      }
    }
  }
}
