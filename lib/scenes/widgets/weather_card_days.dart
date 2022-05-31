import 'package:flutter/material.dart';

class WeatherCardDays extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;
  final int wind;
  final int humidity;

  const WeatherCardDays({
    this.humidity,
    this.wind,
    this.title,
    this.temperature,
    this.iconCode,
    this.temperatureFontSize = 33,
    this.iconScale = 1.9}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 50,
                child: Text(this.title,style: const TextStyle(color: Colors.white, fontSize: 17,), textAlign: TextAlign.left,),
            ),
            Container(
                child: Image.asset(
                  "assets/drop.png", width: 20, height: 20, alignment: Alignment.center,),
            ),
            Text('${this.humidity}%', style: TextStyle(color: Colors.white)),
            Image.asset(
              "assets/wind.png", width: 20, height: 20, color: Colors.white,),
            Text('${this.wind} m/s', style: TextStyle(color: Colors.white)),
            Image.network("http://openweathermap.org/img/wn/${this.iconCode}@4x.png", scale: 5.0),
            Container(
              width: 40,
              child: Text(
                '${this.temperature}°',
                style: TextStyle(fontSize: this.temperatureFontSize, fontWeight: FontWeight.bold,
                    color: Colors.white),
                  textAlign: TextAlign.right
              ),
            ),
          ],
        ),
      ),

    );
  }
}