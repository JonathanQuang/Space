class Moveable{
PVector pos, vel, accel;

    Moveable(PVector thePos, PVector theVel, PVector theAccel){
      pos = thePos;
      vel = theVel;
      accel = theAccel;
  }
  
  void updatePos(){
     pos.add(vel); 
  }
  
  void updateVel() {
     vel.add(accel ); 
  }

  void display(){
     ellipse(pos.x,pos.y,20,20); 
  }
}