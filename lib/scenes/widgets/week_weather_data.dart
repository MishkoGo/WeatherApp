import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/weather_current.dart';

class WeekWeatherData extends StatelessWidget {
  const WeekWeatherData({Key? key, required this.currentWeather}) : super(key: key);

  final WeatherData currentWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: ListView.builder(
               itemBuilder: (BuildContext context, int index) {
                 return Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                       child: Row(
                         children: [
                           Text(DateFormat('EEE').format(DateTime.fromMillisecondsSinceEpoch(currentWeather.dt * 1000)),
                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                           SizedBox(width: 50,),
                           Icon(Icons.wb_sunny, size: 16,color: Colors.yellow,),
                           SizedBox(height: 10,width: 10,),
                           Text('45%'),
                           SizedBox(height: 10,width: 30,),
                           Icon(Icons.waves_rounded, size: 16, color: Colors.lightBlueAccent,),
                           SizedBox(height: 10,width: 10,),
                           Text('14'),
                           SizedBox(height: 10,width: 30,),
                           Icon(Icons.cloud_done, size: 10,color: Colors.lightBlueAccent,),
                           SizedBox(height: 10,width: 10,),
                           Text('3 m/s'),
                         ],
                       ),
                     ),
                   ],
                 );
               },
        ),
      ),
    );
  }
}
