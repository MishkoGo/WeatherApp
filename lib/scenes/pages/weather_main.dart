import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../models/weather_data.dart';
import '../widgets/weather_card_hours.dart';
import '../widgets/weather_days.dart';
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
    return SingleChildScrollView(
      child: Container(
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
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.network("http://openweathermap.org/img/wn/${weather.icon}@2x.png", scale: 1.8,),
                    Text("${weather.temp}℃", style: TextStyle(color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w600),),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          HourlyWeather(listDataWeather: this.hourlyWeather),
          SizedBox(height: 20,),
          DaysWeather(listDataWeather: this.hourlyWeather),
        ]),
      ),
    );
  }
}
