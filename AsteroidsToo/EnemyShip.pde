class EnemyShip extends Ship implements Comparable<EnemyShip> {
  
  //Currently no real functions, needs some more touchups
  
  public EnemyShip() {
    super();
    money = (int)random(100.0, 500.0);
  }
  void display() {
    super.display();
    c = color(250, 0, 0);
    //System.out.println(c);
    fill(c);
    //pos = posAtEdge();
  }
  void move() {
  }

  void posAtEdge() {
    int x = (int)random(4);
    System.out.println(x);
  }
  int compareTo(EnemyShip o) {
    if ( this.money > o.money) {
      return 1;
    }
    if ( this.money < o.money) {
      return -1;
    }
    return 0;
  }
}