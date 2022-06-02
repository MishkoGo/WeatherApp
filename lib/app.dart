import 'package:flutter/material.dart';
import 'package:weather_app_test/scenes/pages/weather_provider.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();

}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WeatherProvider(),
      ),
    );
  }
}
