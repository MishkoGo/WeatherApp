import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_test/scenes/widgets/weather_card_days.dart';

import '../../models/weather_data.dart';

class DaysWeather extends StatelessWidget {
  final List<WeatherData> listDataWeather;

  const DaysWeather({Key key, this.listDataWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(56, 66, 102, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: listDataWeather.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: WeatherCardDays(
                  title:
                  DateFormat('E, ha').format((listDataWeather[i].time)),
                  wind: listDataWeather[i].wind.toInt(),
                  humidity: listDataWeather[i].humidity.toInt(),
                  temperature: listDataWeather[i].temp.toInt(),
                  iconCode: listDataWeather[i].icon,
                  temperatureFontSize: 20,
                ),
              );
            }
        ),
      ),
    );
  }
}