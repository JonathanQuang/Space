class PlayerShip extends Ship {
  // instance vars
  ArrayList<Wall> wallsPlaced;
  PFont f;
  int lastFrame;
  ArrayList<MoneyStorage> storagesPlaced;
  float maxMoney;
  
  // default constructor
  PlayerShip() { 
    super();
    lastFrame = 0;
    money = 0;
    health = 1000;
    shotsFired = new ArrayList<Bullet>();
    wallsPlaced = new ArrayList<Wall>();
    f = createFont("Arial", 4, true);
    storagesPlaced = new ArrayList<MoneyStorage>();
    maxMoney=300;
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
        if (money >= 50) {
          if ( wallsPlaced.size() == 0 ) {
            wallsPlaced.add( new Wall( pos ) );
            money -= 50;
          } else if (frameCount - lastFrame > 50) {
            lastFrame = frameCount; // update last wall placed
            wallsPlaced.add( new Wall( pos ) );
            money -= 50;
          }
        }
      }
      if (key == 'n') {
        if (money >= 100) {
          if ( storagesPlaced.size() == 0 ) {
            storagesPlaced.add( new MoneyStorage( pos ) );
            maxMoney += 100;
            money -= 100;
          } else if ( frameCount - lastFrame > 50) {
            lastFrame = frameCount; // update last wall placed
            storagesPlaced.add( new MoneyStorage( pos ) );
            maxMoney += 100;
            money -= 100;
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
        damageShip( 100 );
        e.damageShip( 100 );
      }
    }
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

  //tells bullets to move
  void fireAll() {
    for (Bullet b : shotsFired) {
      b.updateMovement();
      b.display();
    }
  }

  // displays player
  void display() {
    super.display();
    c = color(0, 100, 0);
    fill(c);
    textFont(f, 16);                  // STEP 3 Specify font to be used
    fill(100);                         // STEP 4 Specify font color 
    text("Money: " + money + "\nMax Money: " + maxMoney + "\nShip HP: " + health  + "\nMarket HP: " + theMarket.hp , 10, 100);   // STEP 5 Display Text
    fill(c);
  }
}