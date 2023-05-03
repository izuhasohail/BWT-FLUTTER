import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task10_riverpord/state_provider/state_provider.dart';
import 'basic_provider/Provider.dart';
import 'future_provider/futureProvider.dart';
import 'future_provider/weather_screen.dart';
//declaring a provider
final stringProvider=Provider<String>((ref) {
  return 'Provider # 2';
},);

final stringProvider1=Provider<String>((ref) => 'Provider # 1 ',);


void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Practice',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const futureProvider(

      ),
    );
  }
}

