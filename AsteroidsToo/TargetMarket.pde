import java.util.Comparator;

public class TargetMarket implements Comparator<Comparable> {
    
  int compare( Comparable a, Comparable b ) {
    if( a.compareTo(b) > b.compareTo(a) ) {
      return 1;
    }
    return 0;
  }
}