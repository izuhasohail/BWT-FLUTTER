void main(){
  //loops & conditional statements
  outerloop: //label 
  for(var i=0;i<6;i++){
    print("Outerloop ${i}");
    for(var j=0;j<4;j++){
      innerloop:

      if(i==3)
      break innerloop;
      if(i==4)
      break outerloop;

      print("Innerloop: ${j}");
    }
    print("\n\n");
    
  }
}