abstract class Ship extends Moveable {
  // instance vars
  float money;
  float yaw = 0;
  float maxVel = 1.4;
  //float maxAccel = 1;
  float collisionRad = 25;
  PVector accel;
  boolean killed;
  ArrayDeque<Weps> weapons;
  ArrayList<Bullet> shotsFired;
  
  // default constructor
  Ship() {
    super(new PVector(400, 400), 
      new PVector(0, 0), 100);
    accel = new PVector(0, 0);
    killed = false;
    weapons = new ArrayDeque();
    weapons.addFirst(new Weps(this));

    shotsFired = new ArrayList<Bullet>();
  }
  
  void shoot(Ship currShip) {
    shotsFired.add( new Bullet(currShip, currShip.weapons.getFirst().damage, currShip.weapons.getFirst().bullet_hp) );
  }
  
  Bullet getBullet( int index ) {
    return shotsFired.get(index);
  }
  
  float getMoney() {
    return money;
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

  // change the amount of money
  void changeMoney(float x) {
    money +=x;
  }
  
  // handles bullet functions
  void fireAll() {
    for (Bullet b : shotsFired) {
      b.updateMovement();
      b.display();
    }
  }
  
  // displays ship
  void display( color newColor ) {
    float vert[] = new float[6]; 
    float a = yaw; // i don't get this line
    for (int x = 0; x < 6; x+=2) {
      vert[x] = pos.x + collisionRad*cos(radians(a-90));
      vert[x+1] = pos.y + collisionRad*sin(radians(a-90));
      a+=120;
    }
    fill( newColor );
    triangle(vert[0], vert[1], vert[2], vert[3], vert[4], vert[5]);
  }
}