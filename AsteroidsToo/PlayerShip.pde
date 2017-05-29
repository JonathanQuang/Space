class PlayerShip extends Ship {
  ArrayDeque<Weps> weapons;
  ArrayList<Bullet> shotsFired;

  PlayerShip() { 
    super();
    lastFrame = 0;
    money = 0;
    weapons = new ArrayDeque();
    weapons.addFirst(new Blaster(this));
    weapons.addFirst(new Weps(this));
    shotsFired = new ArrayList<Bullet>();
  }

  ArrayList<Bullet> getShots() {
    return shotsFired;
  }
  /*
    int bullets;
   int bulletCap;
   int lastFrame; // last frame of shooting
   boolean startTiming; // for when bullets < 3 -- you want to cap bullets
   int last_not_full;
   */
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
        if ( weapons.getFirst().bullets > 0 && (frameCount - lastFrame > weapons.getFirst().frameCD )) {
          lastFrame = frameCount; // update last shot
          // If bullets now one less than cap and not timing yet you need to start the timer
          if (  ( weapons.getFirst().bullets <= weapons.getFirst().bulletCap - 1) && startTiming == false) {
            startTiming=true;
            last_not_full = frameCount;
          }
          shotsFired.add(fireBullet());        
          weapons.getFirst().bullets--;            //System.out.println(bullets);
        }
      }
    }
    applyShipMovement();
  }
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
    void fireAll() {
      for (Bullet b : shotsFired) {
        b.updateMovement();
        b.display();
      }
    }

    void display() {
      super.display();
      c = color(0, 350, 0);
      fill(c);
    }
  }