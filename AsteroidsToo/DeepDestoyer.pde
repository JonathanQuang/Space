//uses piercer weapon and has more HP

class DeepDestroyer extends EnemyShip{
  
    public DeepDestroyer(){
      super( theMarket, thePlayer );
      weapons.removeFirst();
      weapons.addFirst(new Piercer(this));
      this.health = this.health*2;
    }
}