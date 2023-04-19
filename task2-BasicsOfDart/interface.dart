/*dart doesn't ahve a syntax for 
declaring the interfaces.
Class declaration are themselves the interfaces in dart*/
void main(){
  Calculator c=new Calculator();
  print("Discount: ${c.ret_dic()}");
  print("Total: ${c.ret_total()}");
}

class Calculate_Total{
 ret_total(){}
}
class Calculate_discount{
  ret_dic(){}
}
class Calculator implements Calculate_Total,Calculate_discount{
  int ret_total(){
    return 100;
  }
  int ret_dic(){
    return 50;
  }
}