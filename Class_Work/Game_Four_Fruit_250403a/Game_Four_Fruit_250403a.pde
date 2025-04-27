ArrayList <FruitGenerator> fruit;
ArrayList <FruitGenerator> fruitsToRemove;
ArrayList <Fish> fish;
Buttons[] button;
SubClassSandbox iNeed;

boolean playerPressedButton = false;

void setup() {
  size(720, 720);
  rectMode(CENTER);

  iNeed = new SubClassSandbox();
  fruit = new ArrayList <FruitGenerator>();
  fruitsToRemove = new ArrayList <FruitGenerator>();
  fish = new ArrayList <Fish>();
  button = new Buttons[1];

  //buttons location and size
  button[0]= new Buttons(width/2, height - 50, 100, 50);
}

void draw() {
  background(0);

  //when player presses mouse make fruit
  if (mousePressed && !playerPressedButton && iNeed.onlyTriggerMousePressedOnce()) {
    fruit.add(new FruitGenerator(mouseX, mouseY, 50, 50));
  }

  //when player presses button[0] make fish
  if (button[0].iGotTouched && iNeed.onlyTriggerMousePressedOnce()) {
    fish.add(new Fish(random(width), random(height), 40, 40));
    button[0].iGotTouched = false;
  }

  //the fish will always update, whether a fruit exists or not
  for (int i = fish.size() - 1; i >= 0; i--) {
    Fish fishOne = fish.get(i);

    if (!fruit.isEmpty()) {
      //if a fruit exist a fish will try to eat it

      //getting the distance to the closest fruit
      FruitGenerator fruitOne = fruit.get(0);
      float minDist = dist(fishOne.pos.x, fishOne.pos.y, fruitOne.pos.x, fruitOne.pos.y);

      //this is a for-each loop, it goes through each element in a list and gives access to them
      for (FruitGenerator f : fruit) {
        //the fish will go to the closest fruit
        float dist = dist(fishOne.pos.x, fishOne.pos.y, f.pos.x, f.pos.y);
        if (dist < minDist) {
          minDist = dist;
          fruitOne = f;
        }
      }

      fishOne.currentState = State.FEEDING;
      iNeed.fishStates(fruitOne, fishOne);

      if (iNeed.collisionWithFishAndFruitGenerator(fishOne, fruitOne) || fruitOne.pos.y > height + 100) {
        if (!fruitsToRemove.contains(fruitOne)) {
          fruitsToRemove.add(fruitOne);
        }
      }

    } else {
      //if no fruit exist, fish will go idle
      fishOne.currentState = State.IDLE;
      iNeed.fishStates(null, fishOne);
    }
  }

  fruit.removeAll(fruitsToRemove);

  //Updates and display the fruit
  for (FruitGenerator i : fruit) {
    FruitGenerator fruitOne = i;
    fruitOne.display();
    fruitOne.update();
  }

  //Updates and display the fish
  for (Fish i : fish) {
    Fish fishOne = i;
    fishOne.display();
  }

  //display and updates buttons
  for (int i = 0; i < button.length; i++) {
    button[i].display();
    button[i].update(iNeed.collisionWithButtonAndMouse(button[i]));

    if (iNeed.collisionWithButtonAndMouse(button[i])) {
      playerPressedButton = true;
    } else if (!iNeed.collisionWithButtonAndMouse(button[i])) {
      playerPressedButton = false;
    }
  }
}
