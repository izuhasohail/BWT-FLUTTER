import 'dart:io';


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential user = await auth.signInWithEmailAndPassword(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(user: user.user!)),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 24.0),
            Text('Don\'t have an account?'),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final UserCredential user = await auth.createUserWithEmailAndPassword(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage(user: user.user!)),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }


}
class FileModel {
  String title;
  String userEmail;
  String url;

  FileModel({required this.title, required this.userEmail,required  this.url});
}


class HomePage extends StatefulWidget {
  HomePage({required this.user});

  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FileModel> files = [];

  @override
  void initState() {
    super.initState();
    getFiles().then((fileModels) {
      setState(() {
        files = fileModels;
      });
    });
  }

//   Future<List<FileModel>> getFiles() async {
//   List<FileModel> fileModels = [];
//   ListResult result = await FirebaseStorage.instance.ref().child(widget.user.email!).listAll();
//   for (Reference ref in result.items) {
//     String url = await ref.getDownloadURL();
//     String name = ref.name.split('.').first;
//     fileModels.add(FileModel(title: name, userEmail: widget.user.email!, url: url));
//   }
//   return fileModels;
// }
Future<List<FileModel>> getFiles() async {
  List<FileModel> fileModels = [];

  // Get a list of all users
 // QuerySnapshot<Map<String, dynamic>> users = await FirebaseFirestore.instance.collection('images').get();


  // Loop through each user's files and retrieve them
 // for (QueryDocumentSnapshot<Map<String, dynamic>> user in users.docs) {
    //final FirebaseStorage storage = FirebaseStorage.instance;


    ListResult result = await FirebaseStorage.instance.ref('images/').listAll();
    
    for (var ref in result.items) {
      String url = await ref.getDownloadURL();
      String name=await ref.getMetadata().toString();
     //ref.name.spl
      String name1 = ref.name.split('.').first;
      fileModels.add(FileModel(title: name, userEmail: name1, url: url));
    }
  //}

  return fileModels;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (BuildContext context, int index) {
          FileModel fileModel = files[index];
          return ListTile(
            leading: Image.network(fileModel.url),
            title: Text(fileModel.title),
            subtitle: Text(fileModel.userEmail),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => UploadPage(user: widget.user,userEmail: widget.user.email,)),
  ).then((value) {
    if (value != null) {
      setState(() {
        files.add(value);
      });
      Navigator.pop(context, value);
    }
  });
},
        child: Icon(Icons.add),
      ),
    );
  }
}

class UploadPage extends StatefulWidget {
  final User? user;
  final String? userEmail; // Add this line

  const UploadPage({Key? key, this.user, this.userEmail}) : super(key: key); // Modify this line

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  final picker = ImagePicker();
  final titleController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImage() async {
    if (_image == null) {
      return;
    }

    String title = titleController.text.trim();

    // Upload image to Firebase Storage
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/${_image!.path.split('/').last}');
    UploadTask uploadTask = storageReference.putFile(_image!);
    await uploadTask;

    // Get download URL of uploaded image
    String imageUrl = await storageReference.getDownloadURL();

    // Save image details to Firestore
    CollectionReference imagesCollection = FirebaseFirestore.instance.collection('images');
    imagesCollection.add({
      'title': title,
      'imageUrl': imageUrl,
      'userEmail': widget.userEmail,
      'uploadedAt': DateTime.now().toIso8601String(),
    });

    // Clear text field and reset image
    titleController.clear();
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image!),
            ),
          ),
          ElevatedButton(
            onPressed: getImage,
            child: Text('Select Image'),
          ),
          ElevatedButton(
            onPressed: uploadImage,
            child: Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}