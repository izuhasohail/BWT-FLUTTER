void main(){
  //some operations on Numerics
  //int , double
  //num type is basically inherited by int and double
  num a=10;
  num b=10.25;
  print(a);
  print(b);
  print("\n");
  print(num.parse("10.22"));
  print(num.parse("12"));
  print(12.hashCode);
  print(12.isNaN);
  print(12.isFinite);
  print(125.isInfinite);
  print((-12).isNegative);
  print(12.365.truncate());

}