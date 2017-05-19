class Moveable{
PVector pos, vel, accel;

    Moveable(PVector thePos, PVector theVel, PVector theAccel){
      pos = thePos;
      vel = theVel;
      accel = theAccel;
  }
  
  void updatePos(){
     pos.add(vel/100.0); 
  }
  
  void updateVel() {
     vel.add(accel/100.0); 
  }

  void display(){
     ellipse(pos.x,pos.y,5,5); 
  }
}