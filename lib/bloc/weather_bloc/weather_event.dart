part of 'weather_bloc.dart';

class WeatherEvent {}

class WeatherUpdateEvent extends WeatherEvent{
  late WeatherData weatherData;

  WeatherUpdateEvent(this.weatherData);
}
