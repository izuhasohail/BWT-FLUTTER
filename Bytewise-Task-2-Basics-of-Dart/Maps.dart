void main(){
  var map1={"Name":"Zuha","Roll no":10
  ,"Batch":"27"};
  print(map1);
  Map m={"Username":"name","password":"pass@123",
  };
  m.addAll({"Userid":"U101"});
  print(m);

  //functions in maps
  print(m.keys);
  print(m.values);
  //m.remove("password");
  //print(m.remove("password"));
  m.forEach((key, value)=>print("'$key : $value'") );
  print(m);



}