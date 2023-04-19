
void main(){
  //Lists(arrays)
  /*
  1.Fixed length lists
  2.Growable lists
  */ 

  //Fixed length lists
  var list=new List.filled(2,0,growable: false);
  // list=[1,2,5,4];
  //list.add(1); won't run
  list=[2,4,5,6];
  print(list);
  

  //growable list
  var list1=new List.filled(5, 0,growable: true);
  list1.add(8);
  list1=[1,2,3,4,5,6,7,8];
  print(list1);
  print(list1.reversed);
  print(list1.first);
  print(list1.last);
   print(list1.runtimeType);
   list1.replaceRange(0, 3, [0,0,0]);
   print(list1);


}