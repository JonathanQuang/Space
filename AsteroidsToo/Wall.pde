class Wall {
  // instance vars
  PVector pos;
  int hp;
  int len;
  
  // overloaded constructor
  Wall(PVector newPos) {
    float x = newPos.x;
    float y = newPos.y;
    pos = new PVector( x, y );
    hp = 100;
    len = 30;
  }
  
  // display wall
  void display() {
    rect(pos.x, pos.y, len, len);   
  }
  
  
  
}