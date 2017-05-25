class Ship extends Moveable {
  float yaw = 0;
  float maxVel = 0.6;
  //float maxAccel = 1;
  float collisionRad = 25;

  
  //Placeholder constructor for a general ship
  Ship(){
     super(new PVector(400,400),
          new PVector(0,0),
          new PVector(0,0));
  }
  
  //This keeps the yaw within the 0-360 degrees or 0-2pi range that the sine and cosine function accept
  void changeYaw(float inYaw){
     yaw += inYaw;
     if (yaw > 360){
        yaw -= 360; 
     }
     if (yaw < 0){
        yaw+=360; 
     }
  }
  
  //This applies acceleration in the direction the "ship" is facing in;
  void accelViaYaw(float magnitude){
     PVector addTo = new PVector();
     addTo.x = magnitude*cos(radians(yaw-90));
     addTo.y = magnitude*sin(radians(yaw-90));
     accel=addTo;
  }
  
  //This update the velocity and position according to acceleration
  void applyShipMovement(){
    if (vel.mag() > maxVel){
       vel.setMag(maxVel); 
    }
     updateVel(); 
    updatePos();
  }
  
  //currently, this just displays an equilateral triangle at the ship's position.
  void display(){
     float vert[] = new float[6]; 
     float a = yaw;
     for (int x = 0; x < 6; x+=2){
        vert[x] = pos.x + collisionRad*cos(radians(a-90));
        vert[x+1] = pos.y + collisionRad*sin(radians(a-90));
        a+=120;
     }
     triangle(vert[0],vert[1],vert[2],vert[3],vert[4],vert[5]);
  }
  
  

}