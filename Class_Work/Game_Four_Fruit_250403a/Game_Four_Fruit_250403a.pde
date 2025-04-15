ArrayList <FruitGenerator> fruit;
ArrayList <Fish> fish;
SubClassSandbox iNeed;

boolean pressed = false;

void setup() {
  size(720, 720);
  iNeed = new SubClassSandbox();
  fruit = new ArrayList<FruitGenerator>();
  fish = new ArrayList <Fish>();
  fish = new Fish(width/2, height/2, 50, 50);
}

void draw() {
  background(0);
  rectMode(CENTER);

  if (mousePressed && pressed) {
    fruit.add(new FruitGenerator(mouseX, mouseY, 50, 50));
    fish.currentState = State.FEEDING;
    pressed = false;
  }
  if (!mousePressed) {
    pressed = true;
  }

  for (int i = fruit.size() - 1; i >= 0; i--) {
    FruitGenerator fruitOne = fruit.get(i);
    fruitOne.display();
    fruitOne.update();

    if (iNeed.collisionWithFishAndFruitGenerator(fish, fruitOne) || fruitOne.pos.y > height + 100) {
      fruit.remove(i);
      fish.currentState = State.IDLE;
    }
  }

  //.isEmpty() is a method for ArrayList that returns true if the list has nothing, and false if it has at least one.
  if (!fruit.isEmpty()) {
    FruitGenerator fruitOne = fruit.get(0);
    float minDist = dist(fish.pos.x, fish.pos.y, fruitOne.pos.x, fruitOne.pos.y);

    //this is a for-each loop, it gooes through each element in a list and gives access to them
    for (FruitGenerator i : fruit) {
      float dist = dist(fish.pos.x, fish.pos.y, i.pos.x, i.pos.y);
      if (dist < minDist) {
        minDist = dist;
        fruitOne = i;
      }
    }

    fish.update(fruitOne);
  }
  FruitGenerator fruitOne = fruit.get(0);
  fish.display();
  fish.update(fruitOne);
}
