class Bullet extends Moveable{
   Ship Shooter;
   float ang;
   
//UNTESTED
   
    public Bullet(Ship theShooter){
        super(theShooter.pos,theShooter.vel);
        Shooter = theShooter;
    }
    void display(){
       ellipse(pos.x,pos.y,5,5); 
    }
    public void updateMovement(){
      updatePos();
    }
}
