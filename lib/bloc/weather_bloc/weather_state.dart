part of 'weather_bloc.dart';

abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState{
 final WeatherData weatherData;

 WeatherLoadedState(this.weatherData);
}

