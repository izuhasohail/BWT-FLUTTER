void main(){
  Student s=new Student("Manha");
  s.stud_age=20;

  print("Name: ${s.name} \nAge:${s.stud_age}");
 
}

class Student{
  String name="NULL";
  int age=0;

  Student(name){
    this.name=name;
  }
  String get stud_name{
    return this.name;
  }
  void set stud_name(String n){
    this.name=n;
  }
  int get stud_age{
    return this.age;
  }
  void set stud_age(age){
    this.age=age;
  }

  void display_info(){
    print("Name: ${this.name} , Age: ${this.age}");
  }


}