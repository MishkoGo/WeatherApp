import 'package:flutter/material.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/scenes/pages/search_page.dart';
import 'package:weather_app/scenes/pages/weather_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(181, 217, 243, 1),
          title: Text('Weather', style: TextStyle(color: Color.fromRGBO(36, 36, 36, 50)),),
          centerTitle: true,
        ),
        body: WeatherPage(),
      ),
      routes: {
        AppRoutes.searchRoute: (context) => SearchPage(),
      },
    );
  }
}
