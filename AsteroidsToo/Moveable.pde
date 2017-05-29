class Moveable {
  color c;
  PVector pos, vel;

  Moveable(PVector thePos, PVector theVel) {
    pos = thePos;
    vel = theVel;
  }

  void updatePos() {
    pos.add(vel);
  }

  PVector getPos() {
    return pos;
  }
  PVector getVel() {
    return vel;
  }

  void display() {
    ellipse(pos.x, pos.y, 50, 50);
    c = color(0,250,0);
    fill(c);
  }
}