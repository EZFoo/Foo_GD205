ArrayList <FruitGenerator> fruit;
ArrayList <Fish> fish;
Buttons[] button;
SubClassSandbox iNeed;

boolean playerPressedButton = false;

void setup() {
  size(720, 720);
  rectMode(CENTER);

  iNeed = new SubClassSandbox();
  fruit = new ArrayList <FruitGenerator>();
  fish = new ArrayList <Fish>();
  button = new Buttons[1];

  //buttons location and size
  button[0]= new Buttons(width/2, height - 50, 100, 50);
}

void draw() {
  background(0);

  //when player presses mouse make fruit
  if (mousePressed && !playerPressedButton && iNeed.OnlyTriggerMousePressedOnce()) {
    fruit.add(new FruitGenerator(mouseX, mouseY, 50, 50));
  }


  //when player presses button[0] make fish
  if (button[0].iGotTouched && iNeed.OnlyTriggerMousePressedOnce()) {
    fish.add(new Fish(random(width), random(height), 40, 40));
    button[0].iGotTouched = false;
  }

  //.isEmpty() is a method for ArrayList that returns true if the list has nothing, and false if it has at least one.
  if (!fruit.isEmpty()) {

    //if a fruit exist a fish will try to eat it
    for (int i = fish.size() - 1; i >=0; i--) {
      Fish fishOne = fish.get(i);
      fishOne.currentState = State.FEEDING;

      //geting the distance to the closest fruit
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
      fishOne.update(fruitOne);
      
      //If a fish hits a fruit or fruit goes off screen remove it.
      if (iNeed.collisionWithFishAndFruitGenerator(fishOne, fruitOne) || fruitOne.pos.y > height + 100) {
        fruit.remove(i);
        fishOne.currentState = State.IDLE;
      }
    }
  }

  //Updates and display the fruit.
  for (int i = fruit.size() - 1; i >= 0; i--) {
    FruitGenerator fruitOne = fruit.get(i);
    fruitOne.display();
    fruitOne.update();
  }

  for (int i = fish.size() - 1; i >=0; i--) {
    Fish fishOne = fish.get(i);
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
