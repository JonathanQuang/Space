class Wall extends Structure{
  // instance vars
  
  // overloaded constructor
  Wall(PVector newPos) {
    float x = newPos.x;
    float y = newPos.y;
    pos = new PVector( x, y );
    hp = 200;
    len = 30;
  }
}