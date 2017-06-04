class Weps {
  // instance vars
  int bullets;
  int bulletCap;
  int frameCD; // how long to cool down 
  int bulletDirections;
  PVector _pos;
  int damage;
  int bullet_hp;
  // constructor
  public Weps(Ship sh) {
    bullets= 3;
    frameCD = 50;
    _pos = sh.pos;
    damage = 20;
    bullet_hp = 1;
  }

  // display weapon
  void display() {
    ellipse(_pos.x, _pos.y, 5, 5);
  }
}