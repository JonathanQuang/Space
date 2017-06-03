public class Waves {
  int time_allotted;
  int num_shooters;
  int level;
  int time_left;
  int shooters_spawned;
  boolean all_at_once;
  ArrayList<EnemyShip> enemyS;

  Waves() {
    level = 0;
    num_shooters = 0;
    time_allotted = time_left = 600; // in frames
    shooters_spawned=0;
    enemyS = new ArrayList<EnemyShip>();
    all_at_once = false;
  }
  void waveTrack() {
    if ( level == 1 ) {
      num_shooters = 10;
      if ( time_left % 10 == 0 ) {
        enemyS.add(new EnemyShip());
      }
    }
    time_left--;
    if( time_left == 0 ){
      time_allotted +=50;
      time_left = time_allotted;
    }
  }
}