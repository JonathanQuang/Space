class Asteroid extends Moveable { 
  Asteroid(){
    super(new PVector(random(1000)-500,random(800)-400),
          new PVector(random(10)-5,random(10)-5),
          new PVector(0,0));


  }
}