class Bullet extends Moveable{

   float yaw;
   
//UNTESTED
   
    public Bullet(Ship theShooter){
        super( new PVector( theShooter.pos.x, theShooter.pos.y ), new PVector( 0, 0));
        yaw = theShooter.yaw;
        setVel();
    }
    
    void setVel() {
      vel.x = 3*cos(radians(yaw-90));
      vel.y = 3*sin(radians(yaw-90)); 
    }
    void display(){
       ellipse(pos.x,pos.y,5,5);
       System.out.println(pos.x);
      System.out.println(pos.y);
      System.out.println(vel.x);
      System.out.println(vel.y);
    }
    public void updateMovement(){
      updatePos();
    }
}