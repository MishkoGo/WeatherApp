import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/models/weather_current.dart';
import 'core/repository/weather_repository.dart';

class Service{

  static Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      throw Exception('Location permissions are denied. Try to ');
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<void> showMyDialog(BuildContext context, String title,
      String text, String buttonText, onTap) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(text),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: onTap,
            ),
          ],
        );
      },
    );
  }

  static Future<void> currentWeatherResponseTransformer(
      BuildContext context) async {
    ConnectivityResult connection = await Connectivity().checkConnectivity();
    if (connection != ConnectivityResult.none) {
        Position locationData = await Service._determinePosition();

        Response currentWeatherDataResponse =
        await WeatherRepository.listCurrentWeather(
            locationData.latitude, locationData.longitude);
        WeatherData currentWeatherData = WeatherData.fromJson(
            json.decode(currentWeatherDataResponse.body));
        context
            .read<WeatherBloc>()
            .add(WeatherUpdateEvent(currentWeatherData));
    } else {
      Service.showMyDialog(context, "Error", "No internet connection", "OK",
              () async {
            Navigator.of(context).pop();
          });
      return;
    }
  }
}
