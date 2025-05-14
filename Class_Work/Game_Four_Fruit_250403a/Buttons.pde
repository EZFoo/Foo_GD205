class Buttons {

  //PROPERTIES
  PVector pos, heading;
  float sizeX, sizeY;
  
  boolean iGotTouched = false;

  //CONTRUCTORS
  Buttons(float x, float y, float scaleX, float scaleY) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
  }
  //METHODS
  void display() {
    fill(150);
    rect(pos.x, pos.y, sizeX, sizeY, 50);
  }

  void update(boolean touchMe) {
    if(touchMe){
    iGotTouched = true;
    fill(0,0,255);
    }
  }
}
