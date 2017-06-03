class PlayerShip extends Ship {
  // instance vars

  ArrayList<Wall> wallsPlaced;
  PFont f;
  int lastFrame;

  // default constructor
  PlayerShip() { 
    super();
    lastFrame = 0;
    money = 0;

    shotsFired = new ArrayList<Bullet>();
    wallsPlaced = new ArrayList<Wall>();
    f = createFont("Arial", 4, true);
  }

  // #### ACCESSORS #### //
  ArrayList<Bullet> getShots() {
    return shotsFired;
  }
  
  ArrayList<Wall> getWalls() {
    return wallsPlaced; 
  }
  // ################### //

  /*
   int bullets;
   int bulletCap;
   int lastFrame; // last frame of shooting
   boolean startTiming; // for when bullets < 3 -- you want to cap bullets
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
        if ( wallsPlaced.size() == 0 ) {
          wallsPlaced.add( new Wall( pos ) );
        }
        if ( wallsPlaced.size() > 0 && (frameCount - lastFrame > 50)) {
          lastFrame = frameCount; // update last wall placed
          if ( !startTiming ) {
            startTiming=true;
          }
          wallsPlaced.add( new Wall( pos ) );
        }
      }
    }
    applyShipMovement();
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
    text("Money: " + money, 10, 100);   // STEP 5 Display Text
    fill(c);
  }
}