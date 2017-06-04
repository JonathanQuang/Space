class MoneyStorage extends Structure {
  // constructor
  MoneyStorage( PVector newPos ) {
    hp = 100;
    len = 30;
    pos = new PVector( newPos.x, newPos.y );
  }
}