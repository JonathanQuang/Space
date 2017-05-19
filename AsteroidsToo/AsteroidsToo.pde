Moveable test1;


void setup(){
 size(800,800);
 test1 = new Moveable(new PVector(400,0),new PVector(0,1),new PVector(0,0.05));
 
}

void draw(){
    background(0);
    test1.display();
    test1.updatePos();
    test1.updateVel();
}