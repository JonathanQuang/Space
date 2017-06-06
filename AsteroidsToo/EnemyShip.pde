class EnemyShip extends Ship {
  // instance vars
  PriorityQueue<Comparable> targetControl;
  Object target;
  int speed;
  
  // default constructor
  public EnemyShip() {
    super();
    money = random(1,6) * 20;
    setSpawn();
    targetControl=new PriorityQueue<Comparable>();
    prioritize();
    speed = 1;
    c = color(250, 250, 0);
  }

  // sets target
  void prioritize() {
    targetControl.add( theMarket );
    targetControl.add( thePlayer );
  }

  // moves ship
  void move() {
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
    this.vel.y *= speed;
    this.vel.x *= speed;
  }

  // displays enemy ship
  void display() {
    super.display(c);
  } 

  void setSpawn() {
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
    if (this.yaw > redirectYaw) {
      this.changeYaw(-2);
    } else if (this.yaw < redirectYaw) {
      this.changeYaw(2);
    }
  }
}