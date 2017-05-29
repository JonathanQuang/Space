class PlayerShip extends Ship {
  PlayerShip() { 
    super();
    lastFrame = 0;
  }

  ArrayList<Bullet> shotsFired = new ArrayList<Bullet>(); 

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
<<<<<<< HEAD
        changeYaw(-2);
      }
      if (key == 'd') {
        changeYaw(2);

=======
        changeYaw(-3);
        
      }
      if (key == 'd') {
        changeYaw(3);
        
>>>>>>> 6ceb7aac557d2a0403716270486e518cc00d5434
      }
      if (key == 'w') {
        accelViaYaw(0.05);
      }
      if (key == 's') {
        accelViaYaw(-0.05);
      }
      if (key == 'e') {
        if ( bullets > 0 && (frameCount - lastFrame > 20 )) {
          lastFrame = frameCount; // update last shot
          // If bullets now one less than cap and not timing yet you need to start the timer
          if (  ( bullets <= bulletCap - 1) && startTiming == false) {
            startTiming=true;
            last_not_full = frameCount;
          }
          shotsFired.add(fireBullet());        
          bullets = bullets - 1;
          System.out.println(bullets);
        }
      }
    }
    applyShipMovement();
  }

  void fireAll() {
    for (Bullet b : shotsFired) {
      b.updateMovement();
      b.display();
    }
  }
}