abstract class Moveable {
  // instance vars
  color c;
  PVector pos, vel;
  int health;

  // constructor
  Moveable(PVector thePos, PVector theVel, int theHealth) {
    pos = thePos;
    vel = theVel;
    health = theHealth;
  }

  //update Position based on velocity
  void updatePos() {
    pos.add(vel);
  }

  // #### ACCESSORS #### //
  PVector getPos() {
    return pos;
  }
  PVector getVel() {
    return vel;
  }
  boolean isAlive() {
    return health > 0;
  }
  // ################### //
  
  // boundaries wrap around
  void checkBoundary() {
    if (pos.x > width) {
      pos.x = 20;
    } else if (pos.x < 0) {
      pos.x = width-20;
    } else if (pos.y > height) {
      pos.y = 20;
    } else if (pos.y < 0) {
      pos.y = height-20;
    }
  }

  // displays object
  abstract void display();
}