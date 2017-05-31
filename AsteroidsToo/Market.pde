class Market {
  // instance vars
  PVector pos;
  int len;
  int hp;
  
  // default constructor
  Market() {
     pos = new PVector( width/2-len, height/2-len );
     len = 40;
     hp = 20;
  }
  
  // deals damage to market
  void loseHP( int dmg ) {
    hp -= dmg;
  }
  
  //makes the market dissapear when dead by moving it offscreen
  void isAlive() {
   if (hp <= 0) {
     pos = new PVector( -100, -100 );
   }
  }
  
  // displays market
  void display() {
    rect( pos.x, pos.y, len, len );
  }
}