class Wall {
  //PROPERTIES
  PVector wallPos;
  float rectScaleX, rectScaleY;


  // METHODS
  Wall(float x, float y, float ScaleX, float ScaleY) {
    wallPos = new PVector(x, y);
    rectScaleX = ScaleX;
    rectScaleY = ScaleY;
  }

  void display() {
    pushMatrix();
    fill(255);
    rect(wallPos.x, wallPos.y, rectScaleX, rectScaleY);
    popMatrix();
  }

  void update(Bullet POne) {
    //https://youtu.be/8b_reDI7iPM?si=jd2vYaAu9C6rFtIy
    //This random youtuber explain bounding box collision detection which is what I used. Nice :)
    if ((wallPos.x + rectScaleX) >= (POne.startPos.x - POne.size/2) &&
      wallPos.x <= (POne.startPos.x + POne.size/2) && 
      (wallPos.y + rectScaleY) >= (POne.startPos.y - POne.size/2) &&
      wallPos.y <= (POne.startPos.y + POne.size/2)) {


      println("yerrr");
    }
  }
}
