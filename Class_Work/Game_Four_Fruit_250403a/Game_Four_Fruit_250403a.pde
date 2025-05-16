ArrayList <FruitGenerator> fruit;
ArrayList <FruitGenerator> fruitsToRemove;
ArrayList <Fish> fish;

Fish fishPrototype;

Buttons[] button;
SubClassSandbox iNeed;
UI gameUI;

boolean playertouchingButton = false;

void setup() {
  frameRate(120);
  size(1280, 720);
  rectMode(CENTER);

  iNeed = new SubClassSandbox();
  gameUI = new UI();

  fruit = new ArrayList <FruitGenerator>();
  fruitsToRemove = new ArrayList <FruitGenerator>();
  fish = new ArrayList <Fish>();

  //this fish is going to be cloned
  fishPrototype = new Fish(0, 0, 25, 25);

  button = new Buttons[3];

  //buttons location and size
  button[0]= new Buttons(width/2, height - 50, 100, 50, "Spawn Fish");
  button[1]= new Buttons(width/2 - 200, height - 50, 100, 50, "Upgrade Fish Cost");
  button[2]= new Buttons(width/2 + 200, height - 50, 100, 50, "Upgrade Fruit Cost");
}

void draw() {
  background(0);

  //when player presses mouse make fruit
  if (mousePressed && !playertouchingButton && iNeed.onlyTriggerMousePressedOnce()) {
    if (gameUI.money >= gameUI.fruitCost) {
      gameUI.money -= gameUI.fruitCost;
      fruit.add(new FruitGenerator(mouseX, mouseY, 50, 50));
    }
  }


  //when player presses button[0] make fish
  if (button[0].iGotTouched && iNeed.onlyTriggerMousePressedOnce()) {
    if (gameUI.money >= gameUI.fishCost) {
      Fish newFish = fishPrototype.clone();
      newFish.pos = new PVector(random(width), random(height));
      fish.add(newFish);
      gameUI.money -= gameUI.fishCost;
    }
    button[0].iGotTouched = false;
  }


  // Button[1] reduces fish cost (costs money)
  if (button[1].iGotTouched && iNeed.onlyTriggerMousePressedOnce()) {
    if (gameUI.money >= gameUI.fishDiscountCost) {
      gameUI.money -= gameUI.fishDiscountCost;
      gameUI.fishCost = max(1, gameUI.fishCost - 5);

      // Optional: make upgrades cost more each time
      gameUI.fishDiscountCost += 10;
    }
    button[1].iGotTouched = false;
  }

  // Button[2] reduces fruit cost (costs money)
  if (button.length > 2 && button[2].iGotTouched && iNeed.onlyTriggerMousePressedOnce()) {
    if (gameUI.money >= gameUI.fruitDiscountCost) {
      gameUI.money -= gameUI.fruitDiscountCost;
      gameUI.fruitCost = max(1, gameUI.fruitCost - 2);

      // Optional: increase upgrade cost
      gameUI.fruitDiscountCost += 5;
    }
    button[2].iGotTouched = false;
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
          fishOne.hunger += TAU * 0.5;
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
    fishOne.update();
  }

  //display and updates buttons
  playertouchingButton = false;
  for (int i = 0; i < button.length; i++) {
    button[i].display();
    boolean touching = iNeed.collisionWithButtonAndMouse(button[i]);
    button[i].update(touching);
    if (touching) {
      playertouchingButton = true;
    }
  }

  gameUI.display();
  gameUI.update();
}
