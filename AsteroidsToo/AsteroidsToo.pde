
Moveable test1;
AstSpawner _spawner;
Ship theShip;
Market theMarket;

PlayerShip thePlayer;

void setup(){
 size(1000,800);
 //test1 = new Moveable(new PVector(400,0),new PVector(0,1),new PVector(0,0.05));
 _spawner = new AstSpawner(5);
// theShip = new Ship();
 theMarket = new Market();
 //theShip.changeYaw(90);
 //theShip.accelViaYaw(0.01);
 thePlayer = new PlayerShip();
}

void draw(){
    background(0);
    thePlayer.display();
    thePlayer.keyPressed();
    thePlayer.fireAll();
    thePlayer.checkBoundary();
    thePlayer.makeBullets();
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
    _spawner.collisions(thePlayer);
    theMarket.display();
    theMarket.isAlive();
}