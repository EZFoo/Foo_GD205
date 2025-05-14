//I'll use this class for behaviors that will be used a lot
enum State {
  IDLE, FEEDING
}

class SubClassSandbox {
  PVector target;
  boolean pressed = false;
  State currentState = State.IDLE;

  boolean collisionWithFishAndFruitGenerator(Fish bodyOne, FruitGenerator bodyTwo) {
    if ((bodyTwo.pos.x - bodyTwo.sizeX / 2 <= bodyOne.pos.x + bodyOne.sizeX / 2) &&
      (bodyTwo.pos.x + bodyTwo.sizeX / 2 >= bodyOne.pos.x - bodyOne.sizeX / 2) &&
      (bodyTwo.pos.y - bodyTwo.sizeY / 2 <= bodyOne.pos.y + bodyOne.sizeY / 2) &&
      (bodyTwo.pos.y + bodyTwo.sizeY / 2 >= bodyOne.pos.y - bodyOne.sizeY / 2)) {
      return true;
    }
    return false;
  }

  boolean collisionWithButtonAndMouse(Buttons bodyOne) {
    if ((bodyOne.pos.x - bodyOne.sizeX / 2 <= mouseX) &&
      (bodyOne.pos.x + bodyOne.sizeX / 2 >= mouseX) &&
      (bodyOne.pos.y - bodyOne.sizeY / 2 <= mouseY) &&
      (bodyOne.pos.y + bodyOne.sizeY / 2 >= mouseY)) {
      return true;
    }
    return false;
  }

  boolean onlyTriggerMousePressedOnce() {
    if (mousePressed && !pressed) {
      pressed = true;
      return true;
    }
    if (!mousePressed && pressed) {
      pressed = false;
    }
    return false;
  }

  void fishStates(FruitGenerator one, Fish two) {
    switch(two.currentState) {
    case FEEDING:
      if (one != null) {
        target = PVector.sub(one.pos, two.pos); // direction to fruit
        target.normalize();

        //turn heading toward fruit
        two.heading.lerp(target, 0.05);
        two.heading.normalize();

        // Move forward
        two.pos.add(two.heading.copy().mult(2)); //speed
      }
      break;

    case IDLE:
      // pick a new idle target when close to the current one
      if (two.idleTarget == null || PVector.dist(two.pos, two.idleTarget) < 10) {
        two.idleTarget = new PVector(random(width), random(height));
      }

      // move toward idleTarget
      PVector idleDirection = PVector.sub(two.idleTarget, two.pos);
      idleDirection.normalize();

      two.heading.lerp(idleDirection, 0.02);
      two.heading.normalize();

      two.pos.add(two.heading.copy().mult(1)); // move slow while idle
      break;
    }
  }

  void playerStates(boolean notTouching, boolean mouseTrigger) {
    if (mousePressed && !notTouching && mouseTrigger) {
      fruit.add(new FruitGenerator(mouseX, mouseY, 50, 50));
    }
  }
}
