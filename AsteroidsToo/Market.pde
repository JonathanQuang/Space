class Market extends Structure {
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
    wepList.add("Blaster$1K");
    wepList.add("Piercer$1K");
    indexList = new ArrayList<Integer>();
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
    text("Wall, $250",400, 200);
    text("Storage,$300",400,300);
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

    
  void displayPlayerMoney(PlayerShip Player){
      text("Money" + Player.money,0,50);
  }

  
    boolean isBought(int itemIndex) {
      for (int i=0; i<indexList.size(); i++) {
        if (indexList.get(i)== itemIndex) {
          return true;
        }

     }
     return false;
  }
  
  
  
  void processPurchase(PlayerShip Player){
    if (keyPressed==true) {
      if(key == 'l') {
        if (cursorX==0){ //first column
           if(cursorY==0 && (Player.money >= 1000) && !isBought(0)){
               indexList.add(0);
               Player.money -= 1000;
           }
           if(cursorY==1 && (Player.money >= 1000) && !isBought(1)){
               indexList.add(1);
               Player.money -= 1000;
           }        
      }
      if (cursorX==1){
          if (cursorY==0 && Player.money >= 200){
              Player.health += 100;
              Player.money -= 200;
              System.out.println("work");
          }
          if (cursorY==1 && Player.money >= 250){
              Player.money -= 250;
              Player.storedWalls += 1;
          }
          if (cursorY==2 && Player.money >= 300){
              Player.money -= 300;
              Player.storedMoneyStorages += 1;
              System.out.println(MoneyStorages);
          }
      }
    }
    }
  }

  
 
  void processBought(){
     for (int i = 0; i < indexList.size(); i++){
        int purchaseIndex = indexList.get(i);
        fill(250);
        rect(0,50+purchaseIndex*100,400,50);
     }
  }
  
  