import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../models/weather_data.dart';
import '../widgets/weather_days.dart';

class MainScreenWrapper extends StatefulWidget {
  final WeatherData weather;
  final List<WeatherData> hourlyWeather;

  const MainScreenWrapper({
      this.weather,
     this.hourlyWeather})
      : super();
  @override
  State<MainScreenWrapper> createState() => _MainScreenWrapperState();
}

class _MainScreenWrapperState extends State<MainScreenWrapper> {

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
                    Text(widget.weather.name + "/" + widget.weather.sys, style: TextStyle(
                        color: Colors.white, fontSize: 25),),
                    SizedBox(width: 70,),
                  ],
                ),
                SizedBox(height: 3,),
                Row(
                  children: [
                    Text(DateFormat('EEE, MMM d, HH:mm').format((widget.weather.time)), style: TextStyle(
                        color: Colors.white, fontSize: 15)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Image.network("http://openweathermap.org/img/wn/${widget.weather.icon}@2x.png", scale: 1.8,),
                    Text("${widget.weather.temp}℃", style: TextStyle(color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w600),),
                  ],
                ),
              ],
            ),
          ),
         // HourlyWeather(listDataWeather: this.widget.hourlyWeather),
          SizedBox(height: 20,),
          DaysWeather(listDataWeather: this.widget.hourlyWeather),
        ]),
      ),
    );
  }
}
