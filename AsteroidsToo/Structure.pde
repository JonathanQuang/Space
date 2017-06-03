abstract class Structure {
  // instance vars
  PVector pos;
  int hp;
  int len;
  
  void loseHP( int dmg ) {
    hp -= dmg;
  }
  
  void display() {
    rect( pos.x, pos.y, len, len );
  }
  
  boolean isAlive() {
   return hp > 0;
  }
}