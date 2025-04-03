FruitGenerator player;
Fish fish;

void setup(){
size(720,720);

player = new FruitGenerator(width/2, height/2, 200, 200);
}

void draw(){
  background(0);
  rectMode(CENTER);
  player.display();
  player.update();
}
