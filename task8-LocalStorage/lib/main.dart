import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('shopping_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Map<String,dynamic>> _items=[];

  final _shoppingBox=Hive.box('shopping_box');
  @override
  void initState(){
    super.initState();
    _refreshItems();//Load data when app starts
  }

  void _refreshItems(){
    final data=_shoppingBox.keys.map((key) {
      final item = _shoppingBox.get(key);
      return{"key":key,"name":item["name"],"quantity":item['quantity']};
    }).toList();

    setState(() {
      _items= data.reversed.toList();
      print(_items.length);
    });
  }


  Future<void> _createItem(Map<String ,dynamic> newItem) async{
    await _shoppingBox.add(newItem);  //automatic 0/1/2/3...
    // print("amount data is ${_shoppingBox.length}");
    _refreshItems();}

    Future<void> _updateItem(int itemKey,Map<String,dynamic>item) async{
      await _shoppingBox.put(itemKey, item);
      _refreshItems();
    }

    Future<void> _deleteItem(int itemKey) async{
      await _shoppingBox.delete(itemKey);
      _refreshItems();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted'))
      );
    }
  void _showForm(BuildContext ctx,int? itemkey) async{


    if(itemkey!=null){
      final existingItem=
      _items.firstWhere((element) => element['key']==itemkey);
      _nameController.text=existingItem['name'];
      _quantityController.text=existingItem['quantity'];
    }
    showModalBottomSheet(
      context: ctx, 
      elevation: 5,
      isScrollControlled: true,
      builder:(_)=> Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          top: 15,
          left: 15,
          right : 15
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Name'
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Quantity'
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: ()async{

              if(itemkey==null){
                 _createItem(
                {
                  "name": _nameController.text,
                "quantity":_quantityController.text
                }

               );
              }
               if(itemkey!=null){
                _updateItem(itemkey,{
                  'name':_nameController.text.trim(),
                  'quantity':_quantityController.text.trim()

                });
              }
              _nameController.text='';
              _quantityController.text='';
              Navigator.of(context).pop();

            }, child: Text(itemkey==null?'Create New':'Update'),
            )
          ],
        ),
      )

    );
  }
 

 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title:const Text('Hive'),
      ),
      body:ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_,index){
          final currentItem=_items[index];
          return Card(
            color:Color.fromARGB(255, 181, 209, 108),
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child:ListTile(
              title:Text(currentItem['name']),
              subtitle: Text(currentItem['quantity'].toString()),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon:const Icon(Icons.edit),
                    onPressed: ()=>
                    _showForm(context, currentItem['key']),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => 
                    _deleteItem(currentItem['key']),
                  ),
                ],
              ),
            ),

          );
        },

      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _showForm(context, null),
        child: const Icon(Icons.add),
      ),// This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}
