class EnemyShip extends Ship implements Comparable<EnemyShip> {
  // Currently no real functions, needs some more touchups

  // default constructor
  public EnemyShip() {
    super();
    money = (int)random(100.0, 500.0);
    setSpawn();
  }

  // moves ship
  void move(PlayerShip pShip) {
    // add movement calls
    this.vel.y = pShip.pos.y-this.pos.y;
    
    this.vel.x = pShip.pos.x-this.pos.x;
    this.vel.normalize();
}

  // ??
  void posAtEdge() {
    int x = (int)random(4);
    System.out.println(x);
  }

  // sees which ship has more money
  int compareTo(EnemyShip o) {
    if ( this.money > o.money) {
      return 1;
    }
    if ( this.money < o.money) {
      return -1;
    }
    return 0;
  }

  // displays enemy ship
  void display() {
    super.display();
    c = color(250, 0, 0);
    //System.out.println(c);
    fill(c);
    //pos = posAtEdge();
  } 

  void setSpawn() {
    /* bottom right corner
     pos.x = random(width - 100, width);
     pos.y= random(height-100,height);
     */

    int x = (int)random(4); // 0 to 3
    //System.out.println(x);
    if ( x == 0 ) {
      // rightmost
      pos.x=random(width-100, width);
      pos.y=random(0, height);
    }
    if ( x == 1 ) { 
      // leftmost
      pos.x=random(0, 100);
      pos.y=random(0, height);
    }
    if ( x == 2 ) { 
      // top most
      pos.x=random(0, width);
      pos.y=random(height-100, height);
    }
    if ( x == 3 ) {
      // bottom most

      pos.x=random(0, width);
      pos.y=random(0, 100);
    }
    /*
      else if (pos.x < 0) {
     pos.x = width-20;
     } else if (pos.y > height) {
     pos.y = 20;
     } else if (pos.y < 0) {
     pos.y = height-20;
     }
     */
  }
}