class PlayerShip extends Ship implements Comparable {
  // instance vars
  ArrayList<Wall> wallsPlaced;
  PFont f;
  int lastFrame;
  ArrayList<MoneyStorage> storagesPlaced;
  float maxMoney;
  int storedWalls = 0;
  int storedMoneyStorages = 0;

  // default constructor
  PlayerShip() { 
    super();
    lastFrame = 0;
    money = 30000;
    health = 1000;
    wallsPlaced = new ArrayList<Wall>();  
    f = createFont("Arial", 4, true);
    storagesPlaced = new ArrayList<MoneyStorage>();
    maxMoney=30000;
    c = color(0, 350, 0);
  }

  // #### ACCESSORS #### //
  ArrayList<Bullet> getShots() {
    return shotsFired;
  }

  ArrayList<Wall> getWalls() {
    return wallsPlaced;
  }

  ArrayList<MoneyStorage> getStorages() {
    return storagesPlaced;
  }

  float getMaxMoney() {
    return maxMoney;
  }
  // ################### //

  /*
   int bullets;
   int bulletCap;
   int lastFrame; // last frame of shooting
   boolean startTiming; // for when bullets < 3 - you want to cap bullets
   int last_not_full;
   */

  //standard WASD, tank movement, q,e switch weapons, l shoots
  void keyPressed() {
    //System.out.println(key); 
    //System.out.println(vel);
    if (keyPressed==true) {
      if (key == 'a') {
        changeYaw(-2);
      }
      if (key == 'd') {
        changeYaw(2);
      }
      if (key == 'w') {
        accelViaYaw(0.05);
      }
      if (key == 's') {
        accelViaYaw(-0.05);
      }
      if (key == 'e') {
        changeWep("e");
      }
      if (key == 'q') {
        changeWep("q");
      }
      if (key == 'l') {
        if ( frameCount - lastFrame > weapons.getFirst().frameCD ) {
          lastFrame = frameCount; // update last shot
          // If bullets now one less than cap and not timing yet you need to start the timer          
          shoot(this);
          // weapons.getFirst().bullets--;            
          // System.out.println(bullets);
        }
      }
      if (key == 'b') {
        if (storedWalls > 0) {
          lastFrame = frameCount; // update last wall placed
          wallsPlaced.add( new Wall( pos ) );
          storedWalls--;
        }

        key = 'f';
      }
      if (key == 'n') {
        System.out.println("works");
        if (storedMoneyStorages > 0) {
          if ( frameCount - lastFrame > 50) {
            lastFrame = frameCount; // update last wall placed
            storagesPlaced.add( new MoneyStorage( pos ) );
            maxMoney += 50;
            storedMoneyStorages--;
          }
        }
        key = 'f'; // interupter
      }
    }
    applyShipMovement();
  }

  //collision with enemies
  void collisionWithEnemies() {
    ArrayList<EnemyShip> listOfEnemies = waveSpawner.enemyS;
    for (EnemyShip e : listOfEnemies) {
      PVector playerPos = new PVector( pos.x, pos.y );
      PVector enemyPos = new PVector( e.pos.x, e.pos.y );
      if (playerPos.sub(enemyPos).mag() <= 50) {
        damageShip( 50 );
        e.damageShip( 100 );
      }
    }
    /*
    for (Kamikaze k : waveSpawner.kamikazE) {
     PVector playerPos = new PVector( pos.x, pos.y );
     PVector enemyPos = new PVector( k.pos.x, k.pos.y );
     if (playerPos.sub(enemyPos).mag() <= 50) {
     damageShip( 50 );
     k.damageShip( 100 );
     }
     }
     */
  }

  //manages the swapping of weapons 
  void changeWep(String x ) {
    // if dequesize is 1 do nothing  

    if (weapons.getFirst() == weapons.getLast() ) {
      return;
    }
    if ( x == "e" ) { // take from first
      weapons.addLast(weapons.removeFirst());
    }
    if ( x == "q" ) { 
      weapons.addFirst(weapons.removeLast());
    }
    System.out.println(weapons.getFirst());
  }

  int compareTo( Object o ) {
    if (o instanceof Market ) {
      return -1;
    }
    return 0;
  }

  void run() {
    display();
    keyPressed();
    fireAll();
    checkBoundary();
    collisionWithEnemies();
  }

  // displays player
  void display() {
    super.display(c);
    textFont(f, 16);                  // STEP 3 Specify font to be used
    fill(100);                         // STEP 4 Specify font color 
    text("Money: " + money + "\nMax Money: " + maxMoney + "\nShip HP: " + health  + "\nMarket HP: " + theMarket.hp +
      "\nWalls" + storedWalls + "\nStorages" + storedMoneyStorages, 10, 100);   // STEP 5 Display Text
    fill(c);
  }
}