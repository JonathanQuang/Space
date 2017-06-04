class Ship extends Moveable {
  // instance vars
  int health;
  float money;
  float yaw = 0;
  float maxVel = 1.4;
  //float maxAccel = 1;
  float collisionRad = 25;
  PVector accel;
  int bullets;
  int bulletCap;
  int lastFrame; // last frame of shooting
  boolean startTiming; // for when bullets < 3 -- you want to cap bullets
  int last_not_full; // LinkedList wepps; 
  boolean killed;
  ArrayDeque<Weps> weapons;
  ArrayList<Bullet> shotsFired;
  //Placeholder constructor for a general ship
  Ship() {
    super(new PVector(400, 400), 
      new PVector(0, 0));
    accel = new PVector(0, 0);
    bullets = 3;
    bulletCap = 3;
    lastFrame = 0;
    startTiming=false;
    last_not_full = 0;
    health = 100;
    killed = false;
    /*
     wepps = new LinkedList();
     wepps.add("eV1");
     wepps.add("eV1");
     wepps.add("eV1");
     wepps.add("eV1");
     wepps.add("eV1");
     money = 0;
     */


    weapons = new ArrayDeque();
    weapons.addFirst(new Weps(this));

    shotsFired = new ArrayList<Bullet>();
  }
  void shoot(Ship currShip) {
    shotsFired.add( new Bullet(currShip, currShip.weapons.getFirst().damage, 1) );
  }

  void damageShip(int dmg) {
    health -= dmg;
    if ( health <= 0 ) { 
      killed = true;
    }
  }

  //change the velocity according to acceleration
  void updateVel() {
    vel.add(accel );
  }

  //This keeps the yaw within the 0-360 degrees or 0-2pi range that the sine and cosine function accept
  void changeYaw(float inYaw) {
    yaw += inYaw;
    if (yaw > 360) {
      yaw -= 360;
    }
    if (yaw < 0) {
      yaw+=360;
    }
  }

  //This applies acceleration in the direction the "ship" is facing in, we subtract 90 because the the positive y direction is actually downwards
  void accelViaYaw(float magnitude) {
    PVector addTo = new PVector();
    addTo.x = magnitude*cos(radians(yaw-90));
    addTo.y = magnitude*sin(radians(yaw-90));
    accel=addTo;
  }

  //This update the vel and pos according to acceleration
  void applyShipMovement() {
    if (vel.mag() > maxVel) {
      vel.setMag(maxVel);
    }
    updateVel(); 
    updatePos();
  }

  // spawns bullet


  void makeBullets() {
    // System.out.println(bullets);
    if ( bullets < 3 ) {
      //System.out.println(frameCount);
      if (frameCount % 100 == 0 ) {
        bullets++; 
        //System.out.println("new bullet added");
      }
      if (bullets==3) {
        startTiming=false;
      }
    }
  }

  // change the amount of money
  void changeMoney(float x) {
    money +=x;
  }
  void fireAll() {
    for (Bullet b : shotsFired) {
      b.updateMovement();
      b.display();
    }
  }
  // currently, this just displays an equilateral triangle at the ship's pos.
  void display() {
    float vert[] = new float[6]; 
    float a = yaw; // i don't get this line
    for (int x = 0; x < 6; x+=2) {
      vert[x] = pos.x + collisionRad*cos(radians(a-90));
      vert[x+1] = pos.y + collisionRad*sin(radians(a-90));
      a+=120;
    }
    triangle(vert[0], vert[1], vert[2], vert[3], vert[4], vert[5]);
  }
}