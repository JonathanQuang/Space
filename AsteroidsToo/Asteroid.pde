import java.lang.Math;

class Asteroid extends Moveable {
  // instance vars
  public boolean dead;
  public float health;
  public float money;
  public int size;
  public int damage;

  // constructor for spawning new asteroids
  Asteroid(int newSize) {
    super(new PVector(random(1000), random(800)), 
      new PVector(random(4)-2, random(4)-2));
    dead = false;
    health = 100;
    money = random(10, 100);
    size = newSize;
    damage = size/3;
  }

  // constructor for splitting asteroids
  Asteroid( int newSize, PVector position ) {
    super( position, new PVector(random(4)-2, random(4)-2));
    dead = false;
    health = 100;
    money = random(10, 100);
    size = newSize;
    damage = size/3;
  }

  // inflicts damage on asteroid
  void damage(float dmg) {
    health-=dmg;
    if (health <= 0 ) {
      dead = true;
    }
  }

  // splits large asteroid into 1-3 smaller asteroids
  void splitAst() {
    if (size > 20) {
      PVector newPos = new PVector( pos.x, pos.y );
      for (int i = 0; i< (int)random(1, 4); i++) {
        _spawner.astList.add( new Asteroid( size-10, newPos ) );
      }
    }
  }

  //##################### HELPERS #####################// 
  private float clamp(float value, float min, float max) {
    return Math.max(min, Math.min(max, value));
  }
  //#########################################################// 

  //##################### COLLISION CODE #####################// 
  // if asteroid hits market, inflict damage on market
  void collisionWithMarket( Market m ) {

    // clamp(value, min, max) - limits value to the range min..max

    // Find the closest point to the circle within the rectangle
    float closestX = clamp(pos.x, m.pos.x, m.pos.x+m.len);
    float closestY = clamp(pos.y, m.pos.y, m.pos.y+m.len);

    // Calculate the distance between the circle's center and this closest point
    float distanceX = pos.x - closestX;
    float distanceY = pos.y - closestY;

    // If the distance is less than the circle's radius, an intersection occurs
    float distanceSquared = (distanceX * distanceX) + (distanceY * distanceY);

    if (distanceSquared < (size * size / 4)) {
      m.loseHP(damage);
      damage(100);
    }
  }

  // if asteroid hits wall, inflict damage on wall
  void collisionWithWalls( ArrayList<Wall> listOfWalls ) {
    for ( Wall m : listOfWalls ) {
      // Find the closest point to the circle within the rectangle
      float closestX = clamp(pos.x, m.pos.x, m.pos.x+m.len);
      float closestY = clamp(pos.y, m.pos.y, m.pos.y+m.len);

      // Calculate the distance between the circle's center and this closest point
      float distanceX = pos.x - closestX;
      float distanceY = pos.y - closestY;

      // If the distance is less than the circle's radius, an intersection occurs
      float distanceSquared = (distanceX * distanceX) + (distanceY * distanceY);

      if (distanceSquared < (size * size / 4)) {
        m.loseHP(damage);
        damage(100);
      }
    }
  }

  // if asteroid hits wall, inflict damage on wall
  void collisionWithStorages( ArrayList<MoneyStorage> listOfStorages ) {
    for ( MoneyStorage m : listOfStorages ) {
      // Find the closest point to the circle within the rectangle
      float closestX = clamp(pos.x, m.pos.x, m.pos.x+m.len);
      float closestY = clamp(pos.y, m.pos.y, m.pos.y+m.len);

      // Calculate the distance between the circle's center and this closest point
      float distanceX = pos.x - closestX;
      float distanceY = pos.y - closestY;

      // If the distance is less than the circle's radius, an intersection occurs
      float distanceSquared = (distanceX * distanceX) + (distanceY * distanceY);

      if (distanceSquared < (size * size / 4)) {
        m.loseHP(damage);
        damage(100);
      }
    }
  }

  // collision with player
  void collisionWithPlayer() {
    PVector AstPos = new PVector( pos.x, pos.y );
    PVector PlayerPos = new PVector( thePlayer.pos.x, thePlayer.pos.y );
    if (AstPos.sub(PlayerPos).mag() <= size/2 + thePlayer.collisionRad) {
      thePlayer.damageShip(damage);
      damage(100);
    }
  }
  
  void collisionWithEnemies() {
    for (EnemyShip e : waveSpawner.enemyS) {
      PVector EnemyPos = new PVector( e.pos.x, e.pos.y );
      PVector AstPos = new PVector( pos.x, pos.y );
      if (EnemyPos.sub(AstPos).mag() <= size/2 + e.collisionRad) {
        e.damageShip(damage);
        damage(100);
      }
      for (int i=0; i<e.shotsFired.size(); i++) {
        Bullet b = e.shotsFired.get(i);
        PVector BulletPos = new PVector( b.pos.x, b.pos.y );
        if (BulletPos.sub(AstPos).mag() <= size/2) {
          b.damage(1);
          damage(100);
        }
        if (!b.isAlive()) {
          e.shotsFired.remove(i);
        }
      }
    }
  }
  //#########################################################// 

  // display asteroid
  void display() {
    ellipse( pos.x, pos.y, size, size );
    c = color(0, 350, 250);
    fill(c);
  }
}