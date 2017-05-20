Moveable test1;
AstSpawner def;

void setup(){
 size(1000,800);
 //test1 = new Moveable(new PVector(400,0),new PVector(0,1),new PVector(0,0.05));
 def = new AstSpawner(25);
}

void draw(){
    background(0);
    def.displayAll();
    def.posAll();
    def.velAll();
}