import './dart/newplus_extension.dart';

void main() {
  plusone_noscope(current_timestamp() == 0 ? 1 : 2);
  
  // start
  var start = current_timestamp();
  
  int x = 0;
  while (x < 200000000) {
    x = plusone_noscope(x);
  }
  
  var end = current_timestamp();
  var elapsed = end - start;
  
  print(elapsed);
}
