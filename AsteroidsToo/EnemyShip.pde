class EnemyShip extends Ship {
  // Currently no real functions, needs some more touchups
  PriorityQueue<Comparable> targetControl;
  Object target;
  // default constructor
  public EnemyShip( Market m, PlayerShip p) {
    super();
    money = (int)random(100.0, 500.0);
    setSpawn();
    targetControl=new PriorityQueue<Comparable>();
    prioritize();
  }

  // sets target
  void prioritize() {
    targetControl.add( theMarket );
    targetControl.add( thePlayer );
  }

  // moves ship
  void move(PlayerShip pShip) {
    // add movement calls
    Object temp = targetControl.peek();
    if (temp instanceof Market ) {
      Market target = (Market)temp;
      this.vel.y = target.pos.y-this.pos.y;
      this.vel.x = target.pos.x-this.pos.x;
    }
    if (temp instanceof PlayerShip ) {
      PlayerShip target = (PlayerShip)temp;
      this.vel.y = target.pos.y-this.pos.y;
      this.vel.x = target.pos.x-this.pos.x;
    }



    this.vel.normalize();

    //this..y = pShip.pos.y-this.pos.y;
    //this.accel.y =
    //this.vel.x = pShip.pos.x-this.pos.x;
  }

  // ??
  // sees which ship has more money

  // displays enemy ship
  void display() {
    super.display();
    c = color(250, 250, 0);
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

  void turnToCoordinate() {
    Object temp = targetControl.peek();
    PVector tarPos = new PVector( 0, 0 );
    if (temp instanceof Market ) {
      Market target = (Market)temp;
      tarPos = target.pos;
    }
    if (temp instanceof PlayerShip ) {
      PlayerShip target = (PlayerShip)temp;
      tarPos = target.pos;
    }
    
    
    //get the angle in radians between the two objects relative to 0 degrees North in a clockwise manner
    float redirectYaw = atan((this.pos.y-tarPos.y)/(this.pos.x-tarPos.x)) + PI/2; 

    //adjust for when atan is negative
    if (this.pos.y > tarPos.y || this.pos.x > tarPos.x) {
      redirectYaw += PI;
    }  

    //adjust for when atan is corrected above, but is a special case due to how the y axis going down is positive
    if (this.pos.y > tarPos.y && this.pos.x < tarPos.x) {
      redirectYaw -= PI;
    }

    //turn to face the the targeted coordinate
    redirectYaw = degrees(redirectYaw);
    System.out.println(redirectYaw + ":" + this.yaw);
    if (this.yaw > redirectYaw) {
      this.changeYaw(-2);
    } else if (this.yaw < redirectYaw) {
      this.changeYaw(2);
    }
  }
}