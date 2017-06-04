public class AstSpawner {
  // instance vars
  public ArrayList<Asteroid> astList;

  // constructor
  AstSpawner(int num_Asteroids) {
    astList = new ArrayList();
    while (num_Asteroids > 0 ) { 
      astList.add( new Asteroid(50) );
      num_Asteroids--;
    }
  }

  //keeps fixed amount of asteroids on screen
  /*
  void manageRespawn() {
    for (int i=0; i < astList.size(); i++) {
      //astList.get(i).isDead();
      if (astList.get(i).dead == true) {
        astList.set(i, new Asteroid());
      }
    }
  }
  */

  //checks for collision on market
  void collisionMarketAll( Market m ) {
    for (int i=0; i<astList.size(); i++) {
      astList.get(i).collisionWithMarket( m );
    }
  }

  //checks for collision on wall
  void collisionWallAll( ArrayList<Wall> listOfWalls ) {
    for (int i=0; i<astList.size(); i++) {
      astList.get(i).collisionWithWalls( listOfWalls );
    }
  }

  //checks for collision on storages
  void collisionStorageAll( ArrayList<MoneyStorage> listOfStorages ) {
    for (int i=0; i<astList.size(); i++) {
      astList.get(i).collisionWithStorages( listOfStorages );
    }
  }
  
  //checks for collision on player
  void collisionPlayerAll() {
    for (Asteroid a : astList) {
      a.collisionWithPlayer();
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
  
  void manageSplit() {
    for (int i=0; i<astList.size(); i++) {
      if (astList.get(i).dead) {
         astList.get(i).splitAst();
         thePlayer.changeMoney(astList.get(i).money);
         astList.remove(i);
         i--;
      }
    }
  }

  // handles all relevant asteroid commands
  void run() {
    displayAll();
    posAll();
    collisionMarketAll( theMarket );
    collisionWallAll( wallS );
    collisionStorageAll( storageS );
    collisionPlayerAll();
    manageSplit();
    //manageRespawn();
  }
}