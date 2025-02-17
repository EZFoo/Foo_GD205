Tank playerOne;
ArrayList <Bullet> Bullets;
Wall[] wall;
boolean shootOnce = false;

void setup() {
  size(720, 720);
  frameRate(30);

  //Players
  playerOne = new Tank();

  //Bullets for the players
  Bullets = new ArrayList <Bullet>();

  //amount of walls
  wall = new Wall[17];

  //walls at the edge of the screen
  wall[0] = new Wall(width/2, 15, width, 30);
  wall[1] = new Wall(width/2, height - 15, width, 30);
  wall[2] = new Wall(15, height/2, 30, height);
  wall[3] = new Wall(width - 15, height/2, 30, height);

  //the rest of the walls
  for (int i = 4; i < wall.length; i++) {
    wall[i] = new Wall(random(width), random(height), 30, 200);
  }
  //background(0);
}


void draw() {
  background(0);

  //when the player presses Z a Bullet will shoot out depending on the heading of Tank
  //And at its location and holding down the key will not allow it to trigger
  if (keyPressed && key == 'z' && !shootOnce) {
    Bullets.add(new Bullet(playerOne.pos.x, playerOne.pos.y, 15, playerOne.heading.x, playerOne.heading.y));
    shootOnce = true;
  } else if (!keyPressed && key == 'z' && shootOnce) {
    shootOnce = false;
  }


  for (int i = 4; i < wall.length; i++) {
    wall[i].display();
  }
  //Using a reverse for loop(it starts at the last Bullet in the list). This was said to help not skip changes to objects or something like that
  for (int i = Bullets.size() - 1; i >= 0; i--) {
    //Note to self cause I forgot ArrayList_name.size() is the amount of objects in the array

    //2nd note I think I might forget this in the future ArrayList_name.get(i) collects index i from the
    //array list and allows you to do operations on it. You'll also need to give it a name
    Bullet playerOneBullets = Bullets.get(i);
    playerOneBullets.update();
    playerOneBullets.display();

    // Check collision with a bullet and a wall
    for (int f = 0; f < wall.length; f++) {
      if (wall[f].bulletHitWall(playerOneBullets)) {


        //using a version of bounding box collision detection, this time I'm asking if a bullet is at the right, left, top or bottom of a wall
        //note for future self, you're asking if the boolean in bullet(POne) called bulletHitWall is true
        if (wall[f].bulletHitWall(playerOneBullets)) {
          if (playerOneBullets.startPos.x > wall[f].wallPos.x - wall[f].rectScaleX / 2 && //This checks if the bullet is to the left wall
            playerOneBullets.startPos.x < wall[f].wallPos.x + wall[f].rectScaleX / 2) {//This checks if the bullet ia to the right of the wall
            playerOneBullets.velocity.y *= -1;
          }
          
          if (playerOneBullets.startPos.y > wall[f].wallPos.y - wall[f].rectScaleY / 2 &&
            playerOneBullets.startPos.y < wall[f].wallPos.y + wall[f].rectScaleY / 2) {
            playerOneBullets.velocity.x *= -1;
          }
        }
      }
    }
  }
  for (int i = 0; i <= wall.length; i++) {
    //if(Tank.tankHitWall(wall));
  }

  //display player one
  playerOne.display(#f96363);
  playerOne.update();

  //displaying the walls at the edges of the screen
  wall[0].display();
  wall[1].display();
  wall[2].display();
  wall[3].display();
}
