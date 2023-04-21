import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with 
SingleTickerProviderStateMixin {
  
  late Animation animation;
  late Animation animation1;
 
 late AnimationController animationController;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController=AnimationController(vsync: this,duration:Duration(seconds: 10) );

    animation= Tween(begin: 0.0,end: 200.0).animate(animationController);
    animation1=Tween(begin: 200.0,end: 0.0).animate(animationController);



    animationController.addListener(() { 
      print(animation.value);
      setState(() {
        
      });
    });

    animationController.forward();
  }

  



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tween'
        ),
      
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              child: Text('Tween Animation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,

                
              ),),
              width: animation.value,
              height: animation.value,
              color: Color.fromARGB(255, 36, 148, 94),

            ),

            const SizedBox(
              height: 100,
            ),

            Container(
              child: Text('Tween Animation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),),
              width: animation1.value,
              height: animation1.value,
              color: Color.fromARGB(255, 111, 156, 28),

            ),

            const SizedBox(
              height: 100,
            ),
          ],
        ),
        // child: Container(
        //   width: animation.value,
        //   height: animation.value,
        //   color: Color.fromARGB(255, 36, 148, 94),

        // ),
     
        
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
