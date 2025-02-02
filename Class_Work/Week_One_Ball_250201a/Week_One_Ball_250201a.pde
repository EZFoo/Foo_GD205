Tank playerOne;
ArrayList<Bullet> playerOneBullet;

float playerOneTankPosX = random(720), playerOneTankPosY = random(720);
void setup() {
  size(720, 720);
  playerOne = new Tank(playerOneTankPosX, playerOneTankPosY);
  playerOneBullet = new ArrayList <Bullet>();

}


void draw() {
  background(50, 20, 80);

  //when the player presses Z a Bullet will shoot out depending on the heading of Tank
  //And at its location
  if (keyPressed && key == 'z') {
    playerOneBullet.add(new Bullet(playerOne.pos.x, playerOne.pos.y, 15, playerOne.heading.x, playerOne.heading.y));
  }

  //Using a reverse for loop(it starts at the last Bullet in the list)
  for (int i = playerOneBullet.size() - 1; i >= 0; i--) {
    //Note to self cause I forgot ArrayList_name.size() is the amount of objects in the array
    
    //2nd note I think I might forget this in the future ArrayList_name.get(i) collects index i from the
    //array list and allows you to do operations on it. You'll also need to give it a name
    Bullet POne = playerOneBullet.get(i);
    POne.update();
    POne.display();
  }

  playerOne.display(255);
  playerOne.update();
}
