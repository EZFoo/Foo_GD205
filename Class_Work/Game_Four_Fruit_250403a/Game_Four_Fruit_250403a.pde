ArrayList <FruitGenerator> player;
Fish fish;
SubClassSandbox iNeed;
//Position


void setup() {
  size(720, 720);

  player = new ArrayList<FruitGenerator>();
  fish = new Fish(width/2, height/2, 50, 50);
}

void draw() {
  background(0);
  rectMode(CENTER);

  for (int i = player.size() - 1; i >= 0; i--) {
    FruitGenerator playerOne = player.get(i);
    playerOne.display();
    playerOne.update();
    fish.update(playerOne);

    if (mousePressed) {
      player.add(new FruitGenerator(random(width), random(height), 50, 50));
    }

    if (iNeed.collisionWithFishAndFruitGenerator(fish, playerOne)) {
      player.remove(1);
    }
  }
  //fish methods
  fish.display();
}
