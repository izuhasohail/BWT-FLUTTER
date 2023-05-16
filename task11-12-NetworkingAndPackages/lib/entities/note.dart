class Note{
  late String title;
  late String text;

  Note(this.title,this.text);

  Note.fromJson(Map<String,dynamic>json){
    title=json['title'];
    text=json['text'];
  }

}