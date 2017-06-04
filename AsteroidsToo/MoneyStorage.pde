class MoneyStorage extends Structure {
  // constructor
  MoneyStorage( PVector newPos ) {
    hp = 20;
    len = 30;
    pos = new PVector( newPos.x, newPos.y );
  }
}