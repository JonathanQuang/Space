class MoneyStorage extends Structure {
  // constructor
  MoneyStorage( PVector newPos ) {
    hp = 100;
    len = 30;
    pos = new PVector( newPos.x, newPos.y );
    c = color( 0, 0, 150 );
  }
  void display() {
    super.display(c);
  }
  
}