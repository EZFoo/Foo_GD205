class Renderer {
  //PROPERTIES
  PVector pos;

  //CONTRUCTORS
  Renderer(float x, float y) {
    pos = new PVector(x, y);
  }

  //METHODS
  void display() {
    //fish tail
    ellipse(pos.x + 12, pos.y + 58, 31, 47);
    ellipse(pos.x - 12, pos.y + 58, 31, 47);
    //fish body
    ellipse(pos.x, pos.y, 50, 100);
    //fish eye
    ellipse(pos.x + 0, pos.y - 30, 20, 18);
  }

  void update() {
  }
}
