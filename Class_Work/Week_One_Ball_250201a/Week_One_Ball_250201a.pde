Tank playerOne;
ArrayList <Bullet> playerOneBullet;
Wall[] border;
boolean shootOnce = false, hitWall = false;

void setup() {
  size(720, 720);

  //Players
  playerOne = new Tank();

  //Bullets for the players
  playerOneBullet = new ArrayList <Bullet>();

  //amount of walls
  border = new Wall[17];

  border[0] = new Wall(width/2, 15, width, 30);
  border[1] = new Wall(width/2, height - 15, width, 30);
  border[2] = new Wall(15, height/2, 30, height);
  border[3] = new Wall(width - 15, height/2, 30, height);

  for (int i = 4; i < border.length; i++) {
    border[i] = new Wall(random(width), random(height), 30, 200);
  }
}


void draw() {
  background(50, 20, 80);

  //when the player presses Z a Bullet will shoot out depending on the heading of Tank
  //And at its location and holding down the key will not allow it to trigger
  if (keyPressed && key == 'z' && !shootOnce) {
    playerOneBullet.add(new Bullet(playerOne.pos.x, playerOne.pos.y, 15, playerOne.heading.x, playerOne.heading.y));
    shootOnce = true;
  }
  if (!keyPressed && key == 'z' && shootOnce) {
    shootOnce = false;
  }


  for (int i = 4; i < border.length; i++) {
    border[i].display();
  }
  //Using a reverse for loop(it starts at the last Bullet in the list)
  for (int i = playerOneBullet.size() - 1; i >= 0; i--) {
    //Note to self cause I forgot ArrayList_name.size() is the amount of objects in the array

    //2nd note I think I might forget this in the future ArrayList_name.get(i) collects index i from the
    //array list and allows you to do operations on it. You'll also need to give it a name
    Bullet POne = playerOneBullet.get(i);
    POne.update();
    POne.display();

    // Check collision with a bullet and a wall
    for (int f = 0; f < border.length; f++) {
      if (border[f].bulletHitWall(POne)) {
        hitWall = true;
      }

      //using a version of bounding box collision detection, this time I'm asking if a bullet is at the right, left, top or bottom of a wall
      //note for future self, you're asking if the boolean in bullet(POne) called bulletHitWall is true
      if (border[f].bulletHitWall(POne)) {
        if (POne.startPos.x > border[f].wallPos.x - border[f].rectScaleX / 2 && //This checks if the bullet’s X-position is to the right of the left edge of the wall.
          POne.startPos.x < border[f].wallPos.x + border[f].rectScaleX / 2) {//This checks if the bullet’s X-position is to the left of the right edge of the wall.
          POne.velocity.y *= -1;
        }
        if (POne.startPos.y > border[f].wallPos.y - border[f].rectScaleY / 2 &&
          POne.startPos.y < border[f].wallPos.y + border[f].rectScaleY / 2) {
          POne.velocity.x *= -1; // Horizontal collision
        }
      }
    }
  }
  //display player one
  playerOne.display(255);
  playerOne.update();

  //displaying the walls at the edges of the screen
  border[0].display();
  border[1].display();
  border[2].display();
  border[3].display();
}
