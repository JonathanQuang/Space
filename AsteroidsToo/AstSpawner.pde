public class AstSpawner{

  ArrayList<Asteroid> astList;
  
  AstSpawner(int num_Asteroids){
     astList = new ArrayList();
     while(num_Asteroids > 0 ){ 
       astList.add( new Asteroid() );
       num_Asteroids--;
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
  void velAll(){
    
    for(int i=0;i<astList.size();i++){
      astList.get(i).updateVel(); 
    }
  }
}