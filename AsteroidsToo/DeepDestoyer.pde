//uses piercer weapon and has more HP
class DeepDestroyer extends EnemyShip{
  
    public DeepDestroyer(){
      super();
      weapons.removeFirst();
      weapons.addFirst(new Piercer(this));
      this.health = this.health*2;
    }
}