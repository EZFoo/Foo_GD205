class Buttons {
  // PROPERTIES
  PVector pos;
  float sizeX, sizeY;
  boolean iGotTouched = false;
  String label = ""; // new

  // CONSTRUCTORS
  Buttons(float x, float y, float scaleX, float scaleY, String labelText) {
    pos = new PVector(x, y);
    sizeX = scaleX;
    sizeY = scaleY;
    label = labelText;
  }

  // METHODS
  void display() {
    fill(150);
    rect(pos.x, pos.y, sizeX, sizeY, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(14);
    text(label, pos.x, pos.y);
  }

  void update(boolean touchMe) {
    if (touchMe) {
      iGotTouched = true;
    }
  }
}
