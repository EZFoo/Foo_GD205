class Buttons {

  //PROPERTIES
  PVector pos, heading;
  float sizeX, sizeY;

  //CONTRUCTORS
  Buttons(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
  }
  //CONTRUCTORS
  void display() {
    pushMatrix();
    fill(150);
    rectMode(CENTER);
    rect(pos.x, pos.y, sizeX, sizeY, 50);
    popMatrix();
  }

  void update(boolean ui) {
    println(ui);
  }
}
