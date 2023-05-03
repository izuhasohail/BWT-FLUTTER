import 'package:flutter/material.dart';
import 'package:task10_riverpord/future_provider/weather_screen.dart';
import '../main.dart';



class futureProvider extends StatelessWidget {
  const futureProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildButton(context),
      ),
    );
  }

  Widget _buildButton(BuildContext context){
    return Center(
      child: ElevatedButton(onPressed: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const WeatherScreen(),),);
    
      }, 

      
      
      child: const Text(
        'FutureProvider',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 185, 70, 70),
          //backgroundColor: Color.fromARGB(255, 11, 84, 143),
        ),
        
    
      ),),
    );
  }
}