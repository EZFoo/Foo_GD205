Tank playerOne;
Bullet[] playerOneBullet;

int playerOneShots = 1;
float playerOneTankPosX = random(720);
float playerOneTankPosY = random(720);
void setup() {
  size(720, 720);
  playerOne = new Tank(playerOneTankPosX, playerOneTankPosY);
  playerOneBullet = new Bullet[playerOneShots];

  for (int i = 0; i < playerOneBullet.length; i++) {
    playerOneBullet[i] = new Bullet(playerOneTankPosX, playerOneTankPosY, 50);
  }
}


void draw() {
  background(0);

  for (int i =0; i < playerOneBullet.length; i++) {
    playerOneBullet[i].display();
    playerOneBullet[i].update();
  }

  playerOne.display();
  playerOne.update();
}
