class Asteroid extends Moveable { 
  Asteroid(){
    super(new PVector(random(1000)-500,random(800)-400),
          new PVector(random(10)-5,random(10)-5),
          new PVector(0,0));
  }
  
  void collisionWithMarket( Market m ) {
    if ( pos.x > m.position.x && pos.x < m.position.x + 40 && pos.y > m.position.y && pos.y < m.position.y + 40 ) {
       m.loseHP( 20 );
    }
  }
  
}