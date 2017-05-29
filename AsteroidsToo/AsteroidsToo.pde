import java.util.PriorityQueue;

Moveable test1;
AstSpawner _spawner;
Ship theShip;
Market theMarket;

PlayerShip thePlayer;
EnemyShip theEnemy;
PriorityQueue<EnemyShip> enemyS;
void setup() {
  size(1000, 800);
  //test1 = new Moveable(new PVector(400,0),new PVector(0,1),new PVector(0,0.05));
  _spawner = new AstSpawner(5);
  // theShip = new Ship();
  theMarket = new Market();
  //theShip.changeYaw(90);
  //theShip.accelViaYaw(0.01);
  thePlayer = new PlayerShip();
  theEnemy = new EnemyShip();
  enemyS = new PriorityQueue();
  enemyS.add(theEnemy);
  enemyS.add(new EnemyShip());
  enemyS.add(new EnemyShip());
  enemyS.add(new EnemyShip());
  enemyS.poll(); // removes richest
}

void draw() {
  //System.out.println(enemyS.peek().money);
  background(0);
  thePlayer.display();
  thePlayer.keyPressed();
  thePlayer.fireAll();
  thePlayer.checkBoundary();
  thePlayer.makeBullets();
  for (EnemyShip x : enemyS) {
    x.display();
    x.applyShipMovement();
  }
  //  thePlayer.stopLR();
  /*
    theShip.display();
   theShip.applyShipMovement();
   theShip.checkBoundary();
   theShip.makeBullets();
   */
  _spawner.run();
  pShipAst(thePlayer, _spawner.astList);
  theMarket.display();
  theMarket.isAlive();

  posAtEdge();
  moveRichestEnemy();
}

// Collisions for player ship and asteroids.

public static void pShipAst(PlayerShip pShip, ArrayList<Asteroid> astList) {
  ArrayList<Bullet> pShots = pShip.getShots();
  for (int j=0; j<pShots.size(); j++) {
    for (int i=0; i<astList.size(); i++) {
      if ( dist(astList.get(i).pos.x, astList.get(i).pos.y, pShots.get(j).pos.x, pShots.get(j).pos.y) < 10) {
        astList.get(i).damage(100);
        if ( astList.get(i).killed) {
          pShip.changeMoney(astList.get(i).money);
          astList.remove(i);
          //System.out.println(pShip.money);
        }
      }
    }
  }
}

void posAtEdge() {
  int x = (int)random(4); // 0 to 3
  //System.out.println(x);
  if ( x == 0 ) {
    // leftmost
  }
  if ( x == 1 ) { 
    // rightmost
  }
  if ( x == 2 ) { 
    // top most
  }
  if ( x == 3 ) {
    // bottom most
  }
}
/*
    0. Traverse through and find value of richest
 1. Search for richest
 2. Have that richest move.
 */

public void moveRichestEnemy() {
  //System.out.println(enemyS.peek().money);
  enemyS.peek().accelViaYaw(0.05);

  // enemyS.
}