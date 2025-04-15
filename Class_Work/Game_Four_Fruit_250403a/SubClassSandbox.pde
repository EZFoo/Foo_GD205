//I'll use this class for behaviors that will be used a lot
class SubClassSandbox {

  boolean collisionWithFishAndFruitGenerator(Fish bodyOne, FruitGenerator bodyTwo) {
    if ((bodyTwo.pos.x - bodyTwo.sizeX / 2 <= bodyOne.pos.x + bodyOne.sizeX / 2) &&
      (bodyTwo.pos.x + bodyTwo.sizeX / 2 >= bodyOne.pos.x - bodyOne.sizeX / 2) &&
      (bodyTwo.pos.y - bodyTwo.sizeY / 2 <= bodyOne.pos.y + bodyOne.sizeY / 2) &&
      (bodyTwo.pos.y + bodyTwo.sizeY / 2 >= bodyOne.pos.y - bodyOne.sizeY / 2)) {
      return true;
    }
    return false;
  }
}
