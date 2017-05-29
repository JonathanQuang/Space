class EnemyShip extends Ship{
  public EnemyShip(){
    super();
    money = (int)random(100.0,500.0);
  }
  void display(){
    super.display();
    c = color(250,0,0);
    //System.out.println(c);
    fill(c);
  }
  void move(){
    
  }
}