import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_current.dart';

import '../../routes.dart';

class TodayDataWidget extends StatelessWidget {
  const TodayDataWidget({Key? key, required this.currentWeather}) : super(key: key);

  final WeatherData currentWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 350,
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Text(currentWeather.name, style: TextStyle(
                      color: Colors.white, fontSize: 25),),
                  SizedBox(width: 110,),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          AppRoutes.searchRoute);
                    },
                    child: Icon(
                      Icons.search, color: Colors.black, size: 25,),
                  ),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  Text('Friday, May 13, 13.00', style: TextStyle(
                      color: Colors.black, fontSize: 15),),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/sun.png", width: 50, height: 50,),
                  SizedBox(width: 10,),
                  Text("${currentWeather.temp}℃", style: TextStyle(color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600),),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
