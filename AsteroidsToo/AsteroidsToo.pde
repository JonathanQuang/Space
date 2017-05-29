import java.util.LinkedList;

Moveable test1;
AstSpawner _spawner;
Ship theShip;
Market theMarket;

PlayerShip thePlayer;
EnemyShip theEnemy;
BST enemyS;
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
  enemyS = new BST();
  enemyS.insert(theEnemy);
  enemyS.insert(new EnemyShip());
  enemyS.insert(new EnemyShip());
  enemyS.insert(new EnemyShip());
}

void draw() {
  background(0);
  thePlayer.display();
  thePlayer.keyPressed();
  thePlayer.fireAll();
  thePlayer.checkBoundary();
  thePlayer.makeBullets();

  theEnemy.display();

  //  thePlayer.stopLR();
  /*
    theShip.display();
   theShip.applyShipMovement();
   theShip.checkBoundary();
   theShip.makeBullets();
   */
  _spawner.displayAll();
  _spawner.posAll();
  _spawner.collisionMarketAll( theMarket );
  _spawner.manageRespawn();
  pShipAst(thePlayer,_spawner.astList);
  theMarket.display();
  theMarket.isAlive();
}

  public void pShipAst(PlayerShip pShip, ArrayList<Asteroid> astList){
    ArrayList<Bullet> pShots = pShip.getShots();
    for(int j=0;j<pShots.size();j++){
      for(int i=0;i<astList.size();i++){
        if( dist(astList.get(i).pos.x,astList.get(i).pos.y,pShots.get(j).pos.x,pShots.get(j).pos.y) < 10){
          astList.get(i).damage(100);
          if( astList.get(i).killed){
            pShip.changeMoney(astList.get(i).money);
            astList.remove(i);
            //System.out.println(pShip.money);
          }
        }
      }
    }
  }
  
  