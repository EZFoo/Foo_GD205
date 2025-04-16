ArrayList <FruitGenerator> fruit;
Fish fish;
Buttons[] button;
SubClassSandbox iNeed;

boolean pressed = false;

void setup() {
  size(720, 720);
  iNeed = new SubClassSandbox();
  fruit = new ArrayList<FruitGenerator>();
  fish = new Fish(width/2, height/2, 50, 50);
  button = new Buttons[1];

  //buttons location and size
  button[0]= new Buttons(width/2, height - 50, 100, 50);
}

void draw() {
  background(0);

  if (mousePressed && !pressed) {
    fruit.add(new FruitGenerator(mouseX, mouseY, 50, 50));
    pressed = true;
  }
  if (!mousePressed && pressed) {
    pressed = false;
  }

  //Updates and display the fruit. If a fish hits a fruit remove it.
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
    //if a fruit exist a fish will try to eat it
    fish.currentState = State.FEEDING;

    //geting the distance to the closest fruit
    FruitGenerator fruitOne = fruit.get(0);
    float minDist = dist(fish.pos.x, fish.pos.y, fruitOne.pos.x, fruitOne.pos.y);

    //this is a for-each loop, it gooes through each element in a list and gives access to them
    for (FruitGenerator i : fruit) {
      //the fish will go to the closest fruit
      float dist = dist(fish.pos.x, fish.pos.y, i.pos.x, i.pos.y);
      if (dist < minDist) {
        minDist = dist;
        fruitOne = i;
      }
    }

    fish.update(fruitOne);
  }



  fish.display();
  button[0].display();
  button[0].update();
}
