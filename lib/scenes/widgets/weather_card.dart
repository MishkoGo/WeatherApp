import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;

  const WeatherCard({
     this.title,
     this.temperature,
     this.iconCode,
    this.temperatureFontSize = 33,
    this.iconScale = 1.9}) : super();

  @override
  Widget build(BuildContext context) {

    Widget buildBorderWidget() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
        child: Container(
          height: MediaQuery.of(context).size.width / 0.1,
          width: 2,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(41, 50, 81, 12)),
          ),
        ),
      );
    }

    return Container(
      child: Row(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(this.title, style: TextStyle(color: Colors.white, fontSize: 17) ,),
                Image.network("http://openweathermap.org/img/wn/${this.iconCode}@2x.png", scale: this.iconScale),
                Text(
                  '${this.temperature}°',
                  style: TextStyle(fontSize: this.temperatureFontSize, fontWeight: FontWeight.bold,
                  color: Colors.white),
                ),
              ],
            ),
          ),
          buildBorderWidget(),
        ],
      ),
    );
  }
}