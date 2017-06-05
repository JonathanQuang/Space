import java.util.PriorityQueue;
import java.util.ArrayDeque;

// instances
AstSpawner _spawner;
Market theMarket;
PlayerShip thePlayer;
//EnemyShip theEnemy;
ArrayList<MoneyStorage> storageS;
ArrayList<Wall> wallS;
boolean gameOver = false;
boolean start = false;
boolean inMarket;
int frameTracker;
Waves waveSpawner;

void setup() {
  size(1000, 800);
  _spawner = new AstSpawner(5);
  theMarket = new Market();
  thePlayer = new PlayerShip();
  waveSpawner = new Waves();
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
  } else if (inMarket) {
    theMarket.openGUI();
    theMarket.updateCursor();
    theMarket.displayPlayerMoney(thePlayer);
    theMarket.processPurchase(thePlayer);
    theMarket.processBought();
    if (keyPressed == true) {
      if (key == 'm') {
        inMarket=false;
        key='f';
      }
    }
  } else if (!gameOver) {
    background(0);
    
    thePlayer.run();
    
    theMarket.collisionWithEnemy();

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
        if (frameCount % 100 == 0 ) {
          x.shoot(x);
        }
        if (!(x instanceof Kamikaze)){
          x.fireAll();
        }

      if (x.health <= 0) {
        waveSpawner.enemyS.remove(x);
      }
      x.turnToCoordinate();
    }

    _spawner.run();

    collisions(thePlayer, _spawner.astList);

    theMarket.display();

    waveSpawner.waveTrack( theMarket, thePlayer);
    waveSpawner.display();
    //moveRichestEnemy();
    if (thePlayer.health <= 0 || !theMarket.isAlive() ) {
      gameOver = true;
    }
    //detect if player presses m
    if (keyPressed == true) {
      if (key == 'm') {
        inMarket=true;
        key='f';
      }
    }
  } else {
    background( 50, 100, 150 );
    fill(0);
    textSize(64); 
    text( "Game Over", 140, 100 );
  }
}


// Master Collision Code
public void collisions(PlayerShip pShip, ArrayList<Asteroid> astList) {
  // Collision between player bullets and asteroids
  for (int j=0; j<pShip.getShots().size(); j++) { 
    for (int i=0; i<astList.size(); i++) { // Asteroids (I)
      if ( dist(astList.get(i).pos.x, astList.get(i).pos.y, pShip.getShots().get(j).pos.x, pShip.getShots().get(j).pos.y) < 25) {
        astList.get(i).damage(100);
        pShip.getShots().get(j).damage(1);
      }
    }
    // Collision between player bullets and enemy ship
    for (int k = 0; k<waveSpawner.enemyS.size(); k++) { // Bullets (J) and Enemies (K)
      //eShip = waveSpawner.enemyS.get(k);
      if ( dist(waveSpawner.enemyS.get(k).pos.x, waveSpawner.enemyS.get(k).pos.y, pShip.getShots().get(j).pos.x, pShip.getShots().get(j).pos.y) < waveSpawner.enemyS.get(k).collisionRad) { //index bounds exception this line

        // 1. Damage ship
        waveSpawner.enemyS.get(k).damageShip(100);
        // 2. Damage bullet
        pShip.getShots().get(j).damage(1);
        // 3. Check if enemy is dead, if dead add cash
        if ( waveSpawner.enemyS.get(k).killed) {
          pShip.changeMoney(waveSpawner.enemyS.get(k).money);
          waveSpawner.enemyS.remove(k);
        }
      }
    }
    //remove bullets that are not alive
    if (!pShip.getShots().get(j).isAlive()) {
      pShip.getShots().remove(j);
    }
  }
  
  for (int l=0; l<waveSpawner.enemyS.size(); l++) {
    // Collision between enemy bullets and player
    for (int m=0; m<waveSpawner.enemyS.get(l).shotsFired.size(); m++) {
      if (dist(waveSpawner.enemyS.get(l).shotsFired.get(m).pos.x, waveSpawner.enemyS.get(l).shotsFired.get(m).pos.y, pShip.pos.x, pShip.pos.y) < 35) { // If bullet is within distance of master bullet 

        // Damage Ship
        pShip.damageShip(20);

        // Damage bullet
        waveSpawner.enemyS.get(l).shotsFired.get(m).damage(1);
        if (waveSpawner.enemyS.get(l).shotsFired.get(m).health <= 0) {
          waveSpawner.enemyS.get(l).shotsFired.remove(m);
        }
      }
    }
  }
  // make sure player doesn't go above money cap
  if (pShip.money > pShip.maxMoney) {
    pShip.money = pShip.maxMoney;
  }
}