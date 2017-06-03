import java.lang.Math;

class Asteroid extends Moveable {
  // instance vars
  public boolean dead;
  public float health;
  public float money;
  public boolean killed;

  // default constructor
  Asteroid() {
    super(new PVector(random(1000), random(800)), 
      new PVector(random(4)-2, random(4)-2));
    dead = false;
    health = 100;
    money = random(10, 100);
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
  void damage(float dmg) {
    health-=dmg;
    if (health <= 0 ) {
      dead = true;
    }
  }

  float clamp(float value, float min, float max) {
    return Math.max(min, Math.min(max, value));
  }

  // if asteroid hits market, inflict damage on market
  // BUGGY
  void collisionWithMarket( Market m ) {

    // clamp(value, min, max) - limits value to the range min..max

    // Find the closest point to the circle within the rectangle
    float closestX = clamp(pos.x, m.pos.x+15, m.pos.x+20);
    float closestY = clamp(pos.y, m.pos.y+15, m.pos.y+20);

    // Calculate the distance between the circle's center and this closest point
    float distanceX = pos.x - closestX;
    float distanceY = pos.y - closestY;

    // If the distance is less than the circle's radius, an intersection occurs
    float distanceSquared = (distanceX * distanceX) + (distanceY * distanceY);
    
    if (distanceSquared < (50 * 50)) {
      m.loseHP(20);
      damage(100);
    }

    /*
    if ( pos.x > m.pos.x && pos.x < m.pos.x + 40 && pos.y > m.pos.y && pos.y < m.pos.y + 40 ) {
     
    PVector position = new PVector( pos.x, pos.y );
    if ( position.sub(m.pos).mag() <= 50 + m.len/2 ) {
      m.loseHP(20);
      damage(100);
    }
    */
  }

  // if asteroid hits wall, inflict damage on wall
  void collisionWithWalls( ArrayList<Wall> listOfWalls ) {
    PVector position = new PVector( pos.x, pos.y );
    for ( Wall m : listOfWalls ) {
      if ( position.sub(m.pos).mag() <= 50 + m.len/2 ) {
        m.loseHP(20);
        damage(100);
      }
    }
  }

  // display asteroid
  void display() {
    super.display();
    c = color(0, 0, 250);
    fill(c);
  }
}