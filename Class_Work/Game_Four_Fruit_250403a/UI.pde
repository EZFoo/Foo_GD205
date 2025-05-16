class UI {
  //PROPERTIES
  PVector pos;
  int money = 30;
  int fruitCost = 5;
  int fishCost = 20;
  int fishDiscountCost = 50;
  int fruitDiscountCost = 30;
  PFont font;

  //CONTRUCTORS
  UI() {
    pos = new PVector(width/2, height/2);
  }

  //METHODS
  void display() {
    font = createFont("AgencyFB-Reg-52.vlw", 52);
    textFont(font);
    fill(255);
    textAlign(CENTER);
    text("$" + money, width/2, height/2);
    textSize(20);
    text("Fish Cost: $" + fishCost, width/2, height/2 + 40);
    text("Fruit Cost: $" + fruitCost, width/2, height/2 + 70);
  }


  void update() {
  }
}
