public class AstSpawner{

  
  public ArrayList<Asteroid> astList;
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

  
  /*public void killAst(){
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