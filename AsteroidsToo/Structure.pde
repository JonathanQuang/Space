abstract class Structure {
  // instance vars
  color c;
  PVector pos;
  int hp;
  int len;

  void loseHP( int dmg ) {
    hp -= dmg;
  }

  void display(color newColor) {
    fill(newColor);
    rect( pos.x, pos.y, len, len ); 
  }

  boolean isAlive() {
    return hp > 0;
  }
}