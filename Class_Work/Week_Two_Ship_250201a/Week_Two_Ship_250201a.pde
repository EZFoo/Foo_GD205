Tank playerOne, playerTwo;
ArrayList <Bullet> pOneBullets, pTwoBullets;
Wall[] wall;
boolean shootOnce = false;

void setup() {
  size(720, 720);

  //Players
  playerOne = new Tank();
  playerTwo = new Tank();

  //Bullets for the players
  pOneBullets = new ArrayList <Bullet>();
  pTwoBullets = new ArrayList <Bullet>();

  //amount of walls
  wall = new Wall[5];

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
  if (keyPressed && key == 'v' && !shootOnce) {
    pOneBullets.add(new Bullet(playerOne.pos.x, playerOne.pos.y, 15, playerOne.heading.x, playerOne.heading.y));
    shootOnce = true;
  } else if (!keyPressed && key == 'v' && shootOnce) {
    shootOnce = false;
  }
  
  if (keyPressed && key == 'm' && !shootOnce) {
    pTwoBullets.add(new Bullet(playerTwo.pos.x, playerTwo.pos.y, 15, playerTwo.heading.x, playerTwo.heading.y));
    shootOnce = true;
  } else if (!keyPressed && key == 'm' && shootOnce) {
    shootOnce = false;
  }


  //Using a reverse for loop(it starts at the last Bullet in the list). This was said to help not skip changes to objects or something like that
  for (int i = pOneBullets.size() - 1; i >= 0; i--) {

    //giving player one their bullets
    Bullet playerOneBullets = pOneBullets.get(i);
    playerOneBullets.update();
    playerOneBullets.display(#ff008d);

    // Check collision with a bullet and a wall
    for (int f = 0; f < wall.length; f++) {
      if (wall[f].bulletHitWall(playerOneBullets)) {
        wall[f].bulletBounceOffWall(wall[f].bulletHitWall(playerOneBullets), playerOneBullets);
      }
    }
  }
  
    for (int i = pTwoBullets.size() - 1; i >= 0; i--) {

    //giving player one their bullets
    Bullet playerTwoBullets = pTwoBullets.get(i);
    playerTwoBullets.update();
    playerTwoBullets.display(#00b8ff);

    // Check collision with a bullet and a wall
    for (int f = 0; f < wall.length; f++) {
      if (wall[f].bulletHitWall(playerTwoBullets)) {
        wall[f].bulletBounceOffWall(wall[f].bulletHitWall(playerTwoBullets), playerTwoBullets);
      }
    }
  }

  //player collision with wall
  for (int i = 0; i < wall.length; i++) {

    if (wall[i].tankHitWall(playerOne)) {
      wall[i].tankBounceOffWall(wall[i].tankHitWall(playerOne), playerOne);
    }
    if (wall[i].tankHitWall(playerTwo)) {
      wall[i].tankBounceOffWall(wall[i].tankHitWall(playerTwo), playerTwo);
    }
  }
  
  //display player one
  playerOne.display(#f96363);
  playerOne.update('a', 'd', 'w', 's');

  //display player two
  playerTwo.display(#d600ff);
  playerTwo.update('4', '6', '8', '2');

  //displaying the walls
  for (int i = 0; i < wall.length; i++) {
    wall[i].display();
  }
}
