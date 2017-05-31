class Wall extends Moveable {
  
  int hp;
  int collRad;
  
  Wall(PVector) {
    super(new PVector(-400, -400), 
      new PVector(0, 0));
    hp = 100;
    collRad = 10;
  }
  
  

  void placeAtPos(PVector placeVec){
    this.pos=placeVec;  
  }
  
  void display (){
    rect(pos.x+collRad/2,pos.y+collRad/2,
         pos.x+collRad/2, pos.y-collRad/2,
         pos.x - collRad/2, pos.y+collRad/2,
         pos.x - collRad/2, pos.y-collRad/2);
         
  }
  
  
  
}