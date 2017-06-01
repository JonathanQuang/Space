class Asteroid extends Moveable {
  // instance vars
  public boolean dead;
  public float health;
  public float money;
  public boolean killed;
  
  // default constructor
  Asteroid(){
    super(new PVector(random(1000),random(800)),
          new PVector(random(4)-2,random(4)-2));
    dead = false;
    health = 100;
    money = random(10,100);
    killed = false;
  }
  
  /*
  void isDead(){
     if (pos.x < 0 || pos.y<0 || pos.x > width || pos.y > height){
        dead = true; 
     }
  }
  */
  
  // inflicts damage on asteroid
  void damage(float dmg){
    health-=dmg;
    if(health <= 0 ) {
      killed = true;
    }
  }
  
  // if asteroid hits market, inflict damage on market
  void collisionWithMarket( Market m ) {
    if ( pos.x > m.pos.x && pos.x < m.pos.x + 40 && pos.y > m.pos.y && pos.y < m.pos.y + 40 ) {
       m.loseHP( 20 );
    }
  }
  
  // display asteroid
  void display(){
    super.display();
    c = color(0,0,250);
    fill(c);
  }
}