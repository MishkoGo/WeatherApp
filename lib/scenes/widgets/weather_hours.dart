import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../models/weather_data.dart';
import 'weather_card_hours.dart';

class HourlyWeather extends StatelessWidget {
  final List<WeatherData> listDataWeather;

  const HourlyWeather({
    this.listDataWeather
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 150.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(56, 66, 102, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, i) {
                return  WeatherCard(
                  title:
                  '${listDataWeather[i].time.hour}:${listDataWeather[i].time.minute}0',
                  temperature: listDataWeather[i].temp.toInt(),
                  iconCode: listDataWeather[i].icon,
                  temperatureFontSize: 20,
                );
              }),
        ));
  }
}
