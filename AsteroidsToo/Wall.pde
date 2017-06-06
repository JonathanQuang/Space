class Wall extends Structure{
  // instance vars
  
  // overloaded constructor
  Wall(PVector newPos) {
    float x = newPos.x;
    float y = newPos.y;
    pos = new PVector( x, y );
    hp = 300;
    len = 30;
    c = color( 0, 150, 0 );
  }
  
  void display() {
    super.display(c);
  }
}