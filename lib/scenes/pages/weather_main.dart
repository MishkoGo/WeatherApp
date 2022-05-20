import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../models/weather_data.dart';
import '../widgets/weather_card.dart';
import '../widgets/weather_hours.dart';

class MainScreenWrapper extends StatelessWidget {
  final WeatherData weather;
  final List<WeatherData> hourlyWeather;

  const MainScreenWrapper({
     this.weather,
     this.hourlyWeather})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          width: 350,
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Text(weather.name + "/" + weather.sys, style: TextStyle(
                      color: Colors.white, fontSize: 25),),
                  SizedBox(width: 70,),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                children: [
                  Text(DateFormat('EEE, MMM d, HH:mm').format((weather.time)), style: TextStyle(
                      color: Colors.white, fontSize: 15)),
                ],
              ),
              Row(
                children: [
                  Text("${weather.temp}℃", style: TextStyle(color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600),),
                ],
              )
            ],
          ),
        ),
        HourlyWeather(hourlyWeather: this.hourlyWeather)
      ]),
    );
  }
}
