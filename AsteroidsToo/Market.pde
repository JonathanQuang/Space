class Market {
  PVector position;
  int len;
  int hp;
  
  Market() {
     position = new PVector( width/2-len, height/2-len );
     len = 40;
     hp = 20;
  }
  
  void display() {
    rect( position.x, position.y, len, len );
  }
  
  void loseHP( int dmg ) {
    hp -= dmg;
  }
  
  void isAlive() {
   if (hp <= 0) {
     position = new PVector( -100, -100 );
   }
  }
  
  
}