abstract class Moveable {
  // instance var
  color c;
  PVector pos, vel;

  // constructor
  Moveable(PVector thePos, PVector theVel) {
    pos = thePos;
    vel = theVel;
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
  // ################### //

  //establish boundaries for moveable objects
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
  void display() {
    ellipse(pos.x, pos.y, 50, 50);
    c = color(0, 250, 350);
    fill(c);
  }
}