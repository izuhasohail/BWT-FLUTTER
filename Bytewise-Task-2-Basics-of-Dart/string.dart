void main(){
  String st1="Software Engineering";
  String st2="Military Institutions";

  print(st1.codeUnits);
  print(st2.split("i"));
  print(st2.split(st2[10]));
  print(st1.substring(5,9));
  print(st1.toLowerCase());
  print(st1.toUpperCase());

  //interpolation
  print("The sum of 2 and 2 is ${2+2}");

}