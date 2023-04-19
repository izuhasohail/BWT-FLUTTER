import 'dart:io';
void main(){
  //int a=10;
  /*will not work as only constants variables are 
  used to determine a compile time constant, so we have to make 
  'a' a constant variable*/
  const a=10;
  const area=a*5*5;
  print("The area is ${area}");
  print(1|1);
  print(1 & 1);
  print(~1);
  print(1<<2);
  print(3>>2);

  //input in dart
  String? name= stdin.readLineSync();
  print("My name is ${name}");
}
