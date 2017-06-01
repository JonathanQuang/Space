public class AstSpawner {
  // instance vars
  public ArrayList<Asteroid> astList;
  ArrayList<Bullet> bullets;

  // constructor
  AstSpawner(int num_Asteroids) {
    astList = new ArrayList();
    while (num_Asteroids > 0 ) { 
      astList.add( new Asteroid() );
      num_Asteroids--;
    }
    bullets = new ArrayList<Bullet>();
  }

  //keeps fixed amount of asteroids on screen
  void manageRespawn() {
    for (int i=0; i < astList.size(); i++) {
      //astList.get(i).isDead();
      if (astList.get(i).dead == true) {
        astList.set(i, new Asteroid());
      }
    }
  }

  //checks for collision on market
  void collisionMarketAll( Market m ) {
    for (int i=0; i<astList.size(); i++) {
      astList.get(i).collisionWithMarket( m );
    }
  }

  // calls display method on asteroids 
  void displayAll() {
    for (int i=0; i<astList.size(); i++) {
      astList.get(i).display();
      astList.get(i).checkBoundary();
    }
  }

  // moves asteroids
  void posAll() {
    for (int i=0; i<astList.size(); i++) {
      astList.get(i).updatePos();
    }
  }

  // handles all relevant asteroid commands
  void run() {
    displayAll();
    posAll();
    collisionMarketAll( theMarket );
    manageRespawn();
  }

  /*
  public void killAst() {
    for (int i=0; i<astList.size(); i++) {
      if (astList.get(i).health<=0) {
        astList.remove(i);
      }
    }
  }
  */

  /*
  void velAll() {
    for (int i=0; i<astList.size(); i++) {    
      astList.get(i).updateVel();
    }
  }
  */
}