//I'll use this class for behaviors that will be used a lot
class SubClassSandbox {
  boolean pressed = false;

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

  boolean OnlyTriggerMousePressedOnce() {
    if (mousePressed && !pressed) {
      pressed = true;
      return true;
    }
    if (!mousePressed && pressed) {
      pressed = false;
    }
    return false;
  }
}
