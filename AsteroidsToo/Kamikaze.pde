//kamkiaze has no weapons, but it rushes the target

class Kamikaze extends EnemyShip{
  
    public Kamikaze(){
    super();
    weapons.removeFirst();//remove the weapon
  }
  
    // moves like enemy ship, but twice the velocity
  void move(PlayerShip pShip) {
    // add movement calls
    this.vel.y = pShip.pos.y-this.pos.y;

    this.vel.x = pShip.pos.x-this.pos.x;


    this.vel.normalize();
    this.vel.setMag(3);
  }
  
}