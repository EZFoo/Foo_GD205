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

  //checks if a tank is hitting a wall
  boolean tankHitWall (Tank tankName) {
    if ((wallPos.x - rectScaleX / 2 <= tankName.pos.x + tankName.hitBoxWidth / 2) &&
      (wallPos.x + rectScaleX / 2 >= tankName.pos.x - tankName.hitBoxWidth / 2) &&
      (wallPos.y - rectScaleY / 2 <= tankName.pos.y + tankName.hitBoxHeight / 2) &&
      (wallPos.y + rectScaleY / 2 >= tankName.pos.y - tankName.hitBoxHeight / 2)) {
      return true;
    }
    return false;
  }

  //reverse the velocity os the bullet depending on where it hit
  void bulletBounceOffWall (boolean bulletHitWall, Bullet bulletName) {
    if (bulletHitWall) {
      if (bulletName.startPos.x > wallPos.x - rectScaleX / 2 && //This checks if the bullet is to the left wall
        bulletName.startPos.x < wallPos.x + rectScaleX / 2) {//This checks if the bullet ia to the right of the wall
        bulletName.velocity.y *= -1;
      }

      if (bulletName.startPos.y > wallPos.y - rectScaleY / 2 &&
        bulletName.startPos.y < wallPos.y + rectScaleY / 2) {
        bulletName.velocity.x *= -1;
      }
    }
  }
  
  void tankBounceOffWall (boolean tankHitWall, Tank tankName) {
    if (tankHitWall) {
      if (tankName.pos.x > wallPos.x - rectScaleX / 2 && //This checks if the bullet is to the left wall
        tankName.pos.x < wallPos.x + rectScaleX / 2) {//This checks if the bullet ia to the right of the wall
        tankName.speed *= -1;
      }

      if (tankName.pos.y > wallPos.y - rectScaleY / 2 &&
        tankName.pos.y < wallPos.y + rectScaleY / 2) {
        tankName.speed *= -1;
      }
    }
  }
}
