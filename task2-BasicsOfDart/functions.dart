void main(){
  print(factorial(5));
  test_param(1);
  test_param1(5,s1:4);

}
factorial(number){
  if(number<=0)
    return 1;
  else
  return number*factorial(number-1);
}
//optional positional parameters
test_param(n1,[s1]){
  print(n1);
  print(s1);
}
//optional names parameters
test_param1(n1,{s1,s2}){
  print("n1:$n1");
  print("s1:$s1");
  print("s2:$s2");

}