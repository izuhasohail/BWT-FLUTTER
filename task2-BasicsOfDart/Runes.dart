import 'dart:core';
/*Strings are a sequence of characters.
 Dart represents strings as a 
sequence of Unicode UTF-16 code units.
 Unicode is a format that 
defines a unique numeric value
 for each letter, digit, and symbol.*/
void main(){
  f1();

}
void f1(){
  String x="Runes";
  print(x.codeUnitAt(0));
  print(x.codeUnits);
}