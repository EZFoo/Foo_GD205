Tank playerOne;
ArrayList <Bullet> playerOneBullet;
Wall[] border;
boolean shootOnce = false;

float playerOneTankPosX = random(720), playerOneTankPosY = random(720);
void setup() {
  size(720, 720);

  //Players
  playerOne = new Tank(playerOneTankPosX, playerOneTankPosY);

  //Bullets for the players
  playerOneBullet = new ArrayList <Bullet>();

  border = new Wall[6];
    for (int i = 0; i < border.length; i++) {
    border[i] = new Wall(random(width), random(height), 30, 80);
  }
}


void draw() {
  background(50, 20, 80);
  
  for (int i = 0; i < border.length; i++) {
    border[i].display();
  }
  //when the player presses Z a Bullet will shoot out depending on the heading of Tank
  //And at its location
  if (keyPressed && key == 'z' && !shootOnce) {
    playerOneBullet.add(new Bullet(playerOne.pos.x, playerOne.pos.y, 15, playerOne.heading.x, playerOne.heading.y));
    shootOnce = true;
  }
  if (!keyPressed && key == 'z' && shootOnce) {
    shootOnce = false;
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
for (int i = 0; i < border.length; i++) {

  }
  playerOne.display(255);
  playerOne.update();
   for (int i = 0; i < border.length; i++) {
    border[i].display();
  }
}
