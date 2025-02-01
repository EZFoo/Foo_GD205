Tank playerOne;

void setup(){
  size(720, 720);
  playerOne = new Tank(random(width*.25, width*.75),
              random(height*.25, height*.75));
}

// make sure you check the other tab!
void draw(){
  background(0);
  
  playerOne.display();
  playerOne.update();
  
}
