class PlayerShip extends Ship {
   PlayerShip(){
      super(); 
   }
   
   ArrayList<Bullet> shotsFired = new ArrayList<Bullet>(); 
  
    ArrayList<Bullet> getShots(){
      return shotsFired;  
    }
    void keyPressed(){
     //System.out.println(key); 
     //System.out.println(vel);
     if (keyPressed==true){
       if (key == 'a'){
        changeYaw(-10);
        key = 'f';
       }
       if (key == 'd'){
        changeYaw(10);
        key = 'f';
       }
       if (key == 'w'){
         accelViaYaw(0.05);
       }
       if (key == 's'){
         accelViaYaw(-0.05);
       }
       if (key == 'e') {
         shotsFired.add(fireBullet());
         key = 'f';
       }
      }
    applyShipMovement();
    }
    
    void fireAll() {
      for (Bullet b : shotsFired) {
         b.updateMovement();
         b.display();
      }
    }
}