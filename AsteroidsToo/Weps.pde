class Weps{
  
  int bullets;
  int bulletCap;
  int frameCD; // how long to cool down 
  int bulletDirections;
  PVector _pos;
  public Weps(Ship sh){
    bullets= 3;
    frameCD = 50;
    _pos = sh.pos;
  }
  void display(){
        ellipse(_pos.x,_pos.y, 5, 5);
  }
}