class Bullet extends Moveable{
   Ship Shooter;
   float ang;
   boolean fired;
   
//UNTESTED
   
    public Bullet(Ship theShooter){
        Shooter = theShooter;
        pos = theShooter.pos;
        ang = theShooter.yaw;
        vel.set(cos(radians(ang))*speedMod,sin(radians(ang))*speedMod);
        fired = false;
    }
    
     void fireBullet(float speedMod){
         fired = true;
         updatePos();
     }
  
    void display(){
       ellipse(pos.x,pos.y,5,5); 
    }
}