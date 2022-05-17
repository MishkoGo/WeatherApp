import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/weather_current.dart';

class TodayDetailsWidget extends StatelessWidget {
  const TodayDetailsWidget({Key? key, required this.currentWeather}) : super(key: key);

  final WeatherData currentWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  child: Column(
                    children: [
                      Text(DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(currentWeather.dt * 1000))),
                      SizedBox(height: 10,),
                      Icon(Icons.wb_sunny, size: 16,color: Colors.yellow,),
                      SizedBox(height: 10,),
                      Icon(Icons.waves_rounded, size: 16, color: Colors.lightBlueAccent,),
                      SizedBox(height: 5,),
                      Text('14'),
                      SizedBox(height: 5,),
                      Icon(Icons.cloud_done, size: 10,color: Colors.lightBlueAccent,),
                      Text('3 m/s'),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
