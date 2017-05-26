class PlayerShip extends Ship {
   PlayerShip(){
      super( new PVector(0, 0)); 
   }
   
    
  
  
    void keyPressed(){
     System.out.println(key); 
     System.out.println(vel);
     if (keyPressed==true){
       if (key == 'a'){
        changeYaw(-3); 
       }
       if (key == 'd'){
        changeYaw(3); 
       }
       if (key == 'w'){
         accelViaYaw(0.05);
       }
       if (key == 's'){
         accelViaYaw(-0.05);
       }
      }
    applyShipMovement();
  }
}