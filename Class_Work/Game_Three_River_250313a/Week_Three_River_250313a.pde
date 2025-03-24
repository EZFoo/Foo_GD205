//this code makes a frogger game. You press W to move foward, if you are not on a platform
//you die and the code breaks 
Frog player;
Wall[] wall;
Collision theyHit;

boolean playerDied = false, playerIsDying;

void setup() {
  size(720, 800);

  //Frog
  player = new Frog(width/2, 600, 16, 16);

  //Collision
  theyHit = new Collision();

  //Walls
  wall = new Wall[44];

  //walls at the edge of the screen
  for (int i = 0; i < 4; i++) {//main wall
    wall[i] = new Wall(width/2, 200 * i, width, 20);
  }
  for (int i = 4; i < 13; i++) {
    wall[i] = new Wall(width/2, 20 * (i - 3), 100, 20);
  }
  for (int i = 13; i < 22; i++) {
    wall[i] = new Wall(width/2, 20 * (i - 2 ), 100, 20);
  }
  for (int i = 22; i < 31; i++) {
    wall[i] = new Wall(width/2, 20 * (i - 1 ), 100, 20);
  }
  for (int i = 31; i < 43; i++) {
    wall[i] = new Wall(width/2, 20 * (i), 100, 20);
    wall[43] = new Wall(width/2, -20, 100, 20);
  }
}

void draw() {
  background(#05d9e8);

  //resets at the starting of each frame
  playerIsDying = true;

  //Wall methods
  for (int i = 0; i < wall.length; i++) {
    wall[i].display();
    wall[i].update(player.frogJump);
    wall[i].frogDied(player.currentState == State.RESPAWN, player.currentState == State.RESPAWN);

    //Collision methods
    //if player is hitting a wall they live
    if (theyHit.collisionWithFrogAndWall(player, wall[i])) {
      playerIsDying = false;
      player.pos.x = wall[i].pos.x;
    }
  }

  //if they aint hitting a wall they die
  playerDied = playerIsDying;

  //Frog methods
  player.death(playerDied);
  player.display();
  player.jump();
}
