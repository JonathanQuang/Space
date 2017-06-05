class Bullet extends Moveable {
  // instance vars
  float yaw; // orientation
  float speed; // how fast
  int damage;    
  
  // constructor
  public Bullet(Ship theShooter, int dmg, int hp) {
    super( new PVector( theShooter.pos.x, theShooter.pos.y ), new PVector( 0, 0), hp);
    yaw = theShooter.yaw;
    speed = 7; // to be put as parameter later
    setVel();
    damage = dmg;
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

  // moves bullet
  public void updateMovement() {
    updatePos();
  }

  // displays bullet
  void display() {
    ellipse(pos.x, pos.y, 5, 5);
  }
}