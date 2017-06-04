class Bullet extends Moveable {
  // instance vars
  float yaw; // orientation
  float speed; // how fast
  int damage;
  int health;
  // constructor
  public Bullet(Ship theShooter, int dmg, int hp) {
    super( new PVector( theShooter.pos.x, theShooter.pos.y ), new PVector( 0, 0));
    yaw = theShooter.yaw;
    speed = 3; // to be put as parameter later
    setVel();
    damage = dmg;
    health = hp;
    while (theShooter.pos.dist(this.pos) < 40) {
      updatePos();
    }
  }

  //sets the velocity of a bullet according to the ship's rotation
  void setVel() {
    // Equal velocity for each bullet
    // Will eventually depend on type of gun
    vel.x = speed*cos(radians(yaw-90)); 
    vel.y = speed*sin(radians(yaw-90));
  }
  
  void damage( int dmg ) {
    health -= dmg;
  }
  
  boolean isAlive() {
    return health > 0;
  }

  // moves bullet
  public void updateMovement() {
    updatePos();
  }
  void changeHealth(int chng){
    health = health + chng;
  }
  // displays bullet
  void display() {
    ellipse(pos.x, pos.y, 5, 5);
  }
}