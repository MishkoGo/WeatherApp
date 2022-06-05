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
        child: Column(
            children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.weather.name + "/" + widget.weather.sys, style: TextStyle(
                        color: Colors.white, fontSize: 25),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(DateFormat('EEE, MMM d, HH:mm').format((widget.weather.time)), style: TextStyle(
                        color: Colors.white, fontSize: 15)),
                  ],
                ),
                SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network("http://openweathermap.org/img/wn/${widget.weather.icon}@2x.png", scale: 1.8,),
                    Text("${widget.weather.temp}℃", style: TextStyle(color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.w500),),
                  ],
                ),
                Container(
                  height: 1,
                  width: 200,
                  color: Colors.grey,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/drop.png", width: 30, height: 30, alignment: Alignment.center,),
                        SizedBox(height: 5,),
                        Text('${widget.weather.humidity}%', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Image.asset(
                          "assets/wind.png", width: 30, height: 30, color: Colors.white,),
                        SizedBox(height: 5,),
                        Text('${widget.weather.wind} m/s', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Image.asset(
                          "assets/cloud.png", width: 30, height: 30, color: Colors.white,),
                        SizedBox(height: 5,),
                        Text('${widget.weather.clouds}%', style: TextStyle(color: Colors.white)),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 1,
                  width: 200,
                  color: Colors.grey,
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
