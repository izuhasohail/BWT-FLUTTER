import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'package:task11networking/entities/note.dart';



void main() {
  runApp(
    MaterialApp(home: HomePage(),)
  );
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> _notes= [];

  Future<List<Note>> fetchNotes() async{
    var url=Uri.parse('http://localhost:3000/posts');
    var response=await http.get(url);

    var notes= <Note>[];

    if(response.statusCode==200){
      var notesJson=json.decode(response.body);
      for(var noteJson in notesJson){
        notes.add(Note.fromJson(noteJson));
      }
    }
    return notes;

  }
  Widget buildUserListTile(Note note) {

  return ListTile(
    title: Text(note.title),
    subtitle: Text(note.text),
  );
}



  @override
  Widget build(BuildContext context) {
    fetchNotes().then((value) {
      setState(() {
         _notes.addAll(value);
      });
     
      
    },);

    void _onDismissed(){}
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter listview with json'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final list=_notes[index];
          return Slidable(
            startActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                backgroundColor: Colors.green,
                icon: Icons.share,
                label: 'Share',
                onPressed:(context) => _onDismissed(),
              ),
              SlidableAction(
                backgroundColor: Colors.blue,
                icon: Icons.archive,
                label: 'Archive',
                onPressed:(context) => _onDismissed(),
              )
            ]),
            endActionPane: ActionPane(motion: const BehindMotion(),
            children: [
              SlidableAction(
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
              onPressed:(context) => _onDismissed(),)
            ],
            ),
            
            child: buildUserListTile(list));
          
          // return Card(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 32.0,bottom: 32.0,left: 16.0,right: 16.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           _notes[index].title,
                  
          //         style: TextStyle(
          //           fontSize: 22,
          //           fontWeight: FontWeight.bold
          //         ),),
          //         Text(
          //           _notes[index].text,
                    
          //         style: TextStyle(
          //           color: Colors.grey.shade600
          //         ),)
          //       ],
          //     ),
          //   ),

          // );
          
        },
        
      ),
    );
  }
}

