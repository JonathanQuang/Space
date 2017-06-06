class Market extends Structure implements Comparable {
  // instance vars
  ArrayList<String> wepList;
  ArrayList<Integer> indexList;
  int cursorX = 0;
  int cursorY = 0;
  int health;
  // default constructor
  Market() {
    pos = new PVector( width/2-len, height/2-len );
    len = 40;
    hp = 1000;
    wepList = new ArrayList<String>();
    wepList.add("Blaster 2.5K");
    wepList.add("Piercer 1K");
    indexList = new ArrayList<Integer>();
    c = color( 0, 0, 175 );
  }

  // makes the market dissapear when dead by moving it offscreen
  void openGUI() {
    fill(100);
    background(100);
    textSize(64);
    String dispString = "";
    for (int i=0; i < wepList.size(); i++) {
      dispString += wepList.get(i) + "\n";
    }
    fill(250);
    text(dispString, 0, wepList.size()*50);
    text("100sHP,$200", 400, 100);
    text("Wall, $250", 400, 200);
    text("Storage,$300", 400, 300);
  }

  void updateCursor() {
    if (keyPressed==true) {
      if (key == 'a') {
        cursorX -= 1;
        key = 'f';
      }
      if (key == 'd') {
        cursorX += 1 ;
        key = 'f';
      }
      if (key == 'w') {
        cursorY -= 1;
        key = 'f';
      }
      if (key == 's') {
        cursorY += 1;
        key = 'f';
      }
    }
    if (cursorX < 0 || cursorX > 1) {
      cursorX=0;
    }
    if (cursorY < 0 || cursorY > 7) {
      cursorY=0;
    }
    fill(250, 0, 0);
    noFill();
    rect(cursorX*400, 50+cursorY*100, 400, 50);
  }


  void displayPlayerMoney(PlayerShip Player) {
    text("Money" + Player.money, 0, 50);
  }


  boolean isBought(int itemIndex) {
    for (int i=0; i<indexList.size(); i++) {
      if (indexList.get(i)== itemIndex) {
        return true;
      }
    }
    return false;
  }

  void collisionWithEnemy() {
    for (EnemyShip e : waveSpawner.enemyS) {
      PVector EnemyPos = new PVector( e.pos.x, e.pos.y );
      PVector MarketPos = new PVector( pos.x, pos.y );
      if (EnemyPos.sub(MarketPos).mag() <= len/2 + e.collisionRad) {
        e.damageShip(100);
        loseHP(50);
      }
      for (int i=0; i<e.shotsFired.size(); i++) {
        Bullet b = e.shotsFired.get(i);
        PVector BulletPos = new PVector( b.pos.x, b.pos.y );
        if (BulletPos.sub(MarketPos).mag() <= len/2) {
          b.damage(1);
          loseHP(20);
        }
        if (!b.isAlive()) {
          e.shotsFired.remove(i);
        }
      }
    }
    /*
    for (Kamikaze k : waveSpawner.kamikazE) {
     PVector EnemyPos = new PVector( k.pos.x, k.pos.y );
     PVector MarketPos = new PVector( pos.x, pos.y );
     if (EnemyPos.sub(MarketPos).mag() <= len/2 + k.collisionRad) {
     k.damageShip(100);
     loseHP(50);
     }
     }
     */
  }

  void processPurchase(PlayerShip Player) {
    if (keyPressed==true) {
      if (key == 'l') {
        System.out.println(cursorY==1 && (Player.money >= 1000) && !isBought(1));
        if (cursorX==0) { //first column
          if (cursorY==0 && (Player.money >= 2500) && !isBought(0)) {
            indexList.add(0);
            Player.money -= 2500;
            Player.weapons.addFirst(new Blaster(Player));
          }
            if (cursorY==1 && (Player.money >= 1000) && !isBought(1)) {
              indexList.add(1);
              System.out.println("bob");
              Player.money -= 1000;
              Player.weapons.addFirst(new Piercer(Player));
            }
          }
        if (cursorX==1) {
          if (cursorY==0 && Player.money >= 200) {
            Player.health += 100;
            Player.money -= 200;
            key = 'f';
          }
          if (cursorY==1 && Player.money >= 250) {
            Player.money -= 250;
            Player.storedWalls += 1;
            key = 'f';
          }
          if (cursorY==2 && Player.money >= 300) {
            Player.money -= 300;
            Player.storedMoneyStorages += 1;
            key = 'f';
          }
        }
      }
    }
  }

  int compareTo( Object o ) {
    if (o instanceof PlayerShip) {
      return 1;
    }
    return 0;
  }

  void processBought() {
    for (int i = 0; i < indexList.size(); i++) {
      int purchaseIndex = indexList.get(i);
      fill(250);
      rect(0, 50+purchaseIndex*100, 400, 50);
    }
  }
  
  void display() {
    super.display(c);
  }
}