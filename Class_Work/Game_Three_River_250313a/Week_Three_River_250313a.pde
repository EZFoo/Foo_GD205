Frog player;
Wall[] wall;
Collision theyHit;

void setup() {
  size(720, 720);

  //Frog
  player = new Frog(width/2, height - 100, 50, 50);

  //Collision
  theyHit = new Collision();

  //Walls
  wall = new Wall[5];

  //walls at the edge of the screen
  wall[0] = new Wall(width/2, 100, width, 30);
  wall[4] = new Wall(width/2, 130, 100, 30);
  wall[1] = new Wall(width/2, 300, width, 30);
  wall[2] = new Wall(width/2, 500, width, 30);
  wall[3] = new Wall(width/2, 700, width, 30);
}

void draw() {
  background(200);

  //Wall methods
  for (int i = 0; i < wall.length; i++) {
    wall[i].display();
    wall[i].update(player.frogJump);

    //Collision methods
    theyHit.collisionWithFrogAndWall(player, wall[i]);
  }

  //Frog methods
  player.display();
  player.jump();
  println(10 % frameRate);
}
