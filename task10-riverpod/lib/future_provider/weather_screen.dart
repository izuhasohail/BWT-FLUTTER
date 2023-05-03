import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task10_riverpord/future_provider/dummy_weather.dart';

final weatherProvider=FutureProvider.autoDispose<String>(
  (ref) => fetchWeatherReport(),
  );

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Weather"),
      ),
      body: ref.watch(weatherProvider).when(data:
       (data) {
        return Center(
          child: Text(data,
          style: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),),
        );
        
      }, error: (error, stackTrace) {
        return Text(error.toString());
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      },),
    );
  }
}