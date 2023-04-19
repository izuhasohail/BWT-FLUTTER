enum Level{
  LOW,
  MEDIUM,
  HIGH
}
void main(){
  print(Level.values);
  Level.values.forEach((v)=>print('values: $v, index:${v.index}'));

  print("High: ${Level.HIGH} , index:${Level.HIGH.index}");
  print("High index: ${Level.values[2]}");

}