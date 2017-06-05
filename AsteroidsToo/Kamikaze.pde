//kamkiaze has no weapons, but it rushes the target

class Kamikaze extends EnemyShip{
  
    public Kamikaze(){
    super();
    targetControl=new PriorityQueue<Comparable>( new TargetMarket() );
    prioritize();
    speed = 2;
  }

}