class Moveable{
PVector pos, vel;

    Moveable(PVector thePos, PVector theVel){
      pos = thePos;
      vel = theVel;   
  }
  
  void updatePos(){
     pos.add(vel); 
  }
  
  PVector getPos(){
    return pos;
  }
  PVector getVel(){
    return vel;
  }

  void display(){
     ellipse(pos.x,pos.y,20,20); 
  }
}