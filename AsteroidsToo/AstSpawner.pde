public class AstSpawner {
  // instance vars
  public ArrayList<Asteroid> astList;
  int lastFrame;

  // constructor
  AstSpawner(int num_Asteroids) {
    astList = new ArrayList();
    while (num_Asteroids > 0 ) { 
      astList.add( new Asteroid( (int)random(2, 6) * 10 ) );
      num_Asteroids--;
    }
    lastFrame = 300;
  }

  //occasionally spawn asteroids
  void manageSpawn() {
    if (frameCount - lastFrame >= 300) {
      astList.add( new Asteroid(50) );
      lastFrame = frameCount;
    }
  }

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
  
  //checks for collision with enemies
  void collisionEnemyAll() {
    for (Asteroid a : astList) {
      a.collisionWithEnemies();
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
  
  // splits asteroids upon death
  void manageSplit() {
    for (int i=0; i<astList.size(); i++) {
      if (astList.get(i).dead) {
         astList.get(i).splitAst();
         thePlayer.changeMoney(astList.get(i).money); // gives money to player when asteroids are destroyed
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
    collisionEnemyAll();
    manageSplit();
    manageSpawn();
  }
}