public class AstSpawner{

  
  ArrayList<Asteroid> astList;
  ArrayList<Bullet> bullets;
  AstSpawner(int num_Asteroids){
     astList = new ArrayList();
     while(num_Asteroids > 0 ){ 
       astList.add( new Asteroid() );
       num_Asteroids--;

     }
    bullets = new ArrayList<Bullet>();
  }

  void manageRespawn() {
     for (int i=0; i < astList.size(); i++){
          astList.get(i).isDead();
          if (astList.get(i).dead == true){
             astList.set(i,new Asteroid()); 
          }
     }
  }

  void collisionMarketAll( Market m ){
    for(int i=0;i<astList.size();i++){
     astList.get(i).collisionWithMarket( m );
   }
  }
  
  void displayAll(){
   for(int i=0;i<astList.size();i++){
     astList.get(i).display(); 
   }
  }
  
  void posAll(){
    for(int i=0;i<astList.size();i++){
      astList.get(i).updatePos(); 
    }
  }
  
  public void collisions(PlayerShip pShip){
    ArrayList<Bullet> pShots = pShip.getShots();
    for(int j=0;j<pShots.size();j++){
      for(int i=0;i<astList.size();i++){
        if( dist(astList.get(i).pos.x,astList.get(i).pos.y,pShots.get(j).pos.x,pShots.get(j).pos.y) < 10){
          astList.get(i).damage(100);
          if( astList.get(i).killed){
            pShip.changeMoney(astList.get(i).money);
            astList.remove(i);
            System.out.println(pShip.money);
          }
        }
      }
    }
  }
  
  public void killAst(){
    for(int i=0;i<astList.size();i++){
      if (astList.get(i).health<=0){
        astList.remove(i);  
      }
    }
  }
  /*
  void velAll(){
    
    for(int i=0;i<astList.size();i++){    astList.get(i).updateVel(); 
    }
  }
  */
}