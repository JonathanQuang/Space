class Asteroid extends Moveable {
  
  
  public boolean dead;
  public float health;
  public float money;
  public boolean killed;
  Asteroid(){
    super(new PVector(random(1000),random(800)),
          new PVector(random(4)-2,random(4)-2));
    dead = false;
    health = 100;
    money = random(10,100);
    killed = false;
  }
  
  void isDead(){
     if (pos.x < 0 || pos.y<0 || pos.x > width || pos.y > height){
        dead = true; 
     }
  }
  void damage(float dmg){
    health-=dmg;
    if(health <= 0 ) {
      killed = true;
    }
  }
  void collisionWithMarket( Market m ) {
    if ( pos.x > m.position.x && pos.x < m.position.x + 40 && pos.y > m.position.y && pos.y < m.position.y + 40 ) {
       m.loseHP( 20 );
    }
  }
  
}