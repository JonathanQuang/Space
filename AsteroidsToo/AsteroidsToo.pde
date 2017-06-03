import java.util.PriorityQueue;
import java.util.ArrayDeque;

// instances
AstSpawner _spawner;
Market theMarket;
PlayerShip thePlayer;
EnemyShip theEnemy;
static PriorityQueue<EnemyShip> enemyS;
ArrayList<Wall> wallS;
boolean start = false;

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
  //enemyS = new PriorityQueue();
  ArrayList enemyS = new ArrayList();

  enemyS.add(theEnemy);  
  enemyS.add(new EnemyShip());
  enemyS.add(new EnemyShip());
  enemyS.add(new EnemyShip());
  enemyS.poll(); // removes richest
  wallS = new ArrayList<Wall>();
}

void mouseClicked() {
  start = true;
}

void draw() {
  //System.out.println(enemyS.peek().money);

  if (!start) {
    background( 0, 255, 0 );
    fill(0);
    textSize(64); 
    text( "Press anywhere to start", 140, 100 );
  } else {
    background(0);

    thePlayer.display();
    thePlayer.keyPressed();
    thePlayer.fireAll();
    thePlayer.checkBoundary();
    thePlayer.makeBullets();

    wallS = thePlayer.getWalls();
    for (int i = 0; i < wallS.size(); i++) {
      Wall w = wallS.get(i);
      if (!w.isAlive()) {
        wallS.remove(i);
      } else {
        w.display();
      }
    }

    for (EnemyShip x : enemyS) {
      x.display();
      x.applyShipMovement();
      x.checkBoundary();
    }

    // thePlayer.stopLR();
    /*
    theShip.display();
     theShip.applyShipMovement();
     theShip.checkBoundary();
     theShip.makeBullets();
     */

    _spawner.run();

    pShipAst(thePlayer, _spawner.astList);

    if (!theMarket.isAlive()) {
      theMarket.pos = new PVector( -100, -100 );
    } else {
      theMarket.display();
    }

    posAtEdge();
    moveRichestEnemy();
  }
}

// Collisions for player ship and asteroids.

public static void pShipAst(PlayerShip pShip, ArrayList<Asteroid> astList) {
  ArrayList<Bullet> pShots = pShip.getShots();
  for (int j=0; j<pShots.size(); j++) {
    for (int i=0; i<astList.size(); i++) {
      if ( dist(astList.get(i).pos.x, astList.get(i).pos.y, pShots.get(j).pos.x, pShots.get(j).pos.y) < 25) {
        astList.get(i).damage(100);
        if ( astList.get(i).killed) {
          pShip.changeMoney(astList.get(i).money);
          astList.remove(i);
          //System.out.println(pShip.money);
        }
      }
    }
    for (int k = 0 ; k<enemyS.size();k++) {
      eShip = enemyS.get(k);
      if ( dist(enemyS.get(k).pos.x, enemyS.get(k).pos.y, pShots.get(j).pos.x, pShots.get(j).pos.y) < 35) {
        enemyS.get(k).damageShip(100);
        if ( eShip.get(k).killed) {
          eShip.changeMoney(eShip.money);
          enemyS.get(k).remove();
      }
      }
    }

    for (int k=0; k<enemyS.size(); k++) {
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
/*
public void moveRichestEnemy() {
  //System.out.println(enemyS.peek().money);
  enemyS.peek().accelViaYaw(0.05);

  // enemyS.
  
}
*/