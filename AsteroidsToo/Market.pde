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
      text("10HP,$200", 400, 100);
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
    void display() {
      fill(250, 0, 0);
      text("Market health: " + hp, 10, 90  );   // STEP 5 Display Text

      boolean isBought(int itemIndex) {
        for (int i=0; i<indexList.size(); i++) {
          if (indexList.get(i)== itemIndex) {
            return true;
          }
        }
        return false;
      }

      void processPurchase(PlayerShip Player) {
        if (keyPressed==true) {
          if (keyCode == ENTER) {
            if (cursorX==0) {
              if (cursorY==0 && (Player.money >= 1000)) {
                indexList.add(0);
              }
              if (cursorY==1 && (Player.money >= 1000)) {
                indexList.add(1);
              }
            }
          }
        }
      }

      void processBought() {
        for (int i = 0; i < indexList.size(); i++) {
          int purchaseIndex = indexList.get(i);
          beginShape();
          vertex(0, 50+100*i);
          vertex(0+400, 50+100+100*i);
          vertex(0, 50+100+100*i);
          vertex(0+400, 50+100*i);
          endShape();
        }
      }
    }