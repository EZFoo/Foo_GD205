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
    fill(#6300ff);
    rectMode(CENTER);
    rect(wallPos.x, wallPos.y, rectScaleX, rectScaleY);
    popMatrix();
  }

  boolean bulletHitWall (Bullet bulletName) {
    //https://youtu.be/8b_reDI7iPM?si=jd2vYaAu9C6rFtIy
    //This random youtuber explain bounding box collision detection which i took insperation. They calculated
    //from the top left but that not working so i changed to the center with rectMode center
    //Note for future, to use the center you x and y values subtract and add them and divide
    //by 2 to get the left and right edge respectively
    if ((wallPos.x - rectScaleX / 2 <= bulletName.startPos.x + bulletName.size / 2) &&
      (wallPos.x + rectScaleX / 2 >= bulletName.startPos.x - bulletName.size / 2) &&
      (wallPos.y - rectScaleY / 2 <= bulletName.startPos.y + bulletName.size / 2) &&
      (wallPos.y + rectScaleY / 2 >= bulletName.startPos.y - bulletName.size / 2)) {
      return true;
    }
    return false;
  }
}
