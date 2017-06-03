import java.util.PriorityQueue;
import java.util.ArrayDeque;

// instances
AstSpawner _spawner;
Market theMarket;
PlayerShip thePlayer;
EnemyShip theEnemy;
ArrayList<MoneyStorage> storageS;
ArrayList<Wall> wallS;
boolean gameOver = false;
boolean start = false;
int frameTracker;
Waves waveSpawner;
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
  waveSpawner = new Waves();

  waveSpawner.enemyS.add(theEnemy);
  /*
  for (int i=0; i<100; i++) {
   
   waveSpawner.enemyS.add(new EnemyShip());
   }
   */
  //enemyS.poll(); // removes richest
  wallS = new ArrayList<Wall>();
  storageS = new ArrayList<MoneyStorage>();
}

void mouseClicked() {
  start = true;
  waveSpawner.level = 1;
}

void draw() {
  //System.out.println(enemyS.peek().money);

  if (!start) {
    background( 0, 255, 0 );
    fill(0);
    textSize(64); 
    text( "Press anywhere to start", 140, 100 );
  } else if (!gameOver) {
    background(0);
    thePlayer.display();
    thePlayer.keyPressed();
    thePlayer.fireAll();
    thePlayer.checkBoundary();
    thePlayer.makeBullets();
    thePlayer.collisionWithEnemies();

    wallS = thePlayer.getWalls();
    for (int i = 0; i < wallS.size(); i++) {
      Wall w = wallS.get(i);
      if (!w.isAlive()) {
        wallS.remove(i);
      } else {
        w.display();
      }
    }

    storageS = thePlayer.getStorages();
    for (int i = 0; i < storageS.size(); i++) {
      MoneyStorage w = storageS.get(i);
      if (!w.isAlive()) {
        storageS.remove(i);
        thePlayer.maxMoney -= 100;
      } else {
        w.display();
      }
    }
    for (int j = 0; j < waveSpawner.enemyS.size(); j++ ) {
      EnemyShip x = waveSpawner.enemyS.get(j);
      x.display();
      x.applyShipMovement();
      x.checkBoundary();
      x.move(thePlayer);
      if (x.health <= 0) {
        waveSpawner.enemyS.remove(x);
      }
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

    theMarket.display();

    waveSpawner.waveTrack();
    //moveRichestEnemy();
    if (thePlayer.health <= 0 || !theMarket.isAlive() ) {
      gameOver = true;
    }
  }
  else {
    background( 50, 100, 150 );
    fill(0);
    textSize(64); 
    text( "Game Over", 140, 100 );
  }
}

// Collisions for player ship and asteroids.

public void pShipAst(PlayerShip pShip, ArrayList<Asteroid> astList) {
  ArrayList<Bullet> pShots = pShip.getShots();
  for (int j=0; j<pShots.size(); j++) {
    for (int i=0; i<astList.size(); i++) {
      if ( dist(astList.get(i).pos.x, astList.get(i).pos.y, pShots.get(j).pos.x, pShots.get(j).pos.y) < 25) {
        astList.get(i).damage(100);
        if ( astList.get(i).dead) {
          pShip.changeMoney(astList.get(i).money);
          astList.remove(i);
          //System.out.println(pShip.money);
        }
      }
    }
    for (int k = 0; k<waveSpawner.enemyS.size(); k++) {
      //eShip = waveSpawner.enemyS.get(k);
      if ( dist(waveSpawner.enemyS.get(k).pos.x, waveSpawner.enemyS.get(k).pos.y, pShots.get(j).pos.x, pShots.get(j).pos.y) < 35) {
        waveSpawner.enemyS.get(k).damageShip(100);
        if ( waveSpawner.enemyS.get(k).killed) {
          pShip.changeMoney(waveSpawner.enemyS.get(k).money);
          waveSpawner.enemyS.remove(k);
        }
      }
    }
  }

  if (pShip.money > pShip.maxMoney) {
    pShip.money = pShip.maxMoney;
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