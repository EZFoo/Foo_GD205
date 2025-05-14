class UI {
  //PROPERTIES
  PVector pos;
  int money;
  PFont font;


  //CONTRUCTORS
  UI() {
    pos = new PVector(width/2, height/2);
  }

  //METHODS
  void display() {
    font = createFont("AgencyFB-Reg-52.vlw", 52);
    textFont(font);
  }

  void update() {
    text("yerr", width/2, height/2);
  }
}
