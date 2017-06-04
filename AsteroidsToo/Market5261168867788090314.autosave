class Market extends Structure {
  // instance vars
  ArrayList<String> wepList;
  ArrayList<Integer> indexList;
  int cursorX = 0;
  int cursorY = 0;

  // default constructor
  Market() {
    pos = new PVector( width/2-len, height/2-len );
    len = 40;
    hp = 100;
    wepList = new ArrayList<String>();
    wepList.add("Blaster$1K");
    wepList.add("Peircer$1K");
    indexList = new ArrayList<Integer>();
  }

  // makes the market dissapear when dead by moving it offscreen

  void openGUI(){
       fill(100);
       background(100);
       textSize(64);
       String dispString = "";
       for (int i=0; i < wepList.size();i++){
         dispString += wepList.get(i) + "\n";
       }
       fill(250);
       text(dispString,0,wepList.size()*50);
       
  }
  
  void updateCursor(){
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
    fill(0);
    noFill();
    rect(cursorX*400,50+cursorY*100,400,50);
    
    
  }
}