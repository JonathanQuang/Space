class Bullet extends Moveable {
  // instance vars
  float yaw; // orientation
  float speed; // how fast

  // constructor
  public Bullet(Ship theShooter) {
    super( new PVector( theShooter.pos.x, theShooter.pos.y ), new PVector( 0, 0));
    yaw = theShooter.yaw;
    speed = 3; // to be put as parameter later
    setVel();
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

  // moves bullet
  public void updateMovement() {
    updatePos();
  }

  // displays bullet
  void display() {
    ellipse(pos.x, pos.y, 5, 5);
  }
}