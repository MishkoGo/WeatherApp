part of 'weather_bloc.dart';

abstract class WeatherState {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final WeatherData weather;
  final List<WeatherData> hourlyWeather;

  const WeatherLoadSuccess(
      { @required this.weather, @required this.hourlyWeather});

  @override
  List<Object> get props => [weather, hourlyWeather];
}