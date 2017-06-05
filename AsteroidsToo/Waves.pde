public class Waves {
  //instance vars
  int time_allotted;
  int num_shooters;
  int level;
  int time_left;
  int shooters_spawned;
  boolean all_at_once;
  ArrayList<EnemyShip> enemyS;
  ArrayList<Kamikaze> kamikazE;
  PFont f;
  
  //default constructor
  Waves() {
    level = 0;
    num_shooters = 0;
    time_allotted = time_left = 6000; // in frames
    shooters_spawned=0;
    enemyS = new ArrayList<EnemyShip>();
    all_at_once = false;
    kamikazE = new ArrayList<Kamikaze>();
  }
  
  void waveTrack(Market theMarket, PlayerShip thePlayer) {
    num_shooters = 3 * (level + 2);

    if (shooters_spawned != num_shooters) { // if all ur shooters haven't spawned it's lit to spawn more
      if ( time_left % 180 == 0 ) {

        if (shooters_spawned % 3 == 0) {
          enemyS.add(new Kamikaze());
        } else {
          enemyS.add(new EnemyShip());
        }
        shooters_spawned += 1;
      }
    }  
    time_left--;
    if ( time_left == 0 ) {
      level++;
      time_allotted +=50;
      time_left = time_allotted;
      shooters_spawned = 0;
    }
  }
  void display() {
    f = createFont("Arial", 4, true);

    color c = color(0, 350, 0);
    fill(c);
    textFont(f, 16);                  // STEP 3 Specify font to be used
    fill(100);                         // STEP 4 Specify font color 
    text(("Level: " + level + "\ntime_left: " + time_left + "\n" +
      "Shooters spawned: " + shooters_spawned + 
      "\nEnemies left:" + (num_shooters - shooters_spawned)), width-160, 100);   // STEP 5 Display Text
    fill(c);
  }
}