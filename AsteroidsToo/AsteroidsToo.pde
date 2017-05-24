Moveable test1;
AstSpawner def;
Ship theShip;
Market theMarket;


void setup(){
 size(1000,800);
 //test1 = new Moveable(new PVector(400,0),new PVector(0,1),new PVector(0,0.05));
 def = new AstSpawner(25);
 theShip = new Ship();
 theMarket = new Market();
 theShip.changeYaw(90);
 theShip.accelViaYaw(0.01);
}

void draw(){
    background(0);
    theShip.display();
    theShip.applyShipMovement();
    def.displayAll();
    def.posAll();
    def.velAll();
    def.collisionMarketAll( theMarket );
    theMarket.display();
    theMarket.isAlive();
    
}