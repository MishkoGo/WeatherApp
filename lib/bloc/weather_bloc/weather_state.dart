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
      { @required this.weather,  this.hourlyWeather}) : assert(weather != null);

  @override
  List<Object> get props => [weather, hourlyWeather];
}
class WeatherLoadFailure extends WeatherState {
  void color(){
    Container(
      height: 400,
      width: 100,
      color: Colors.white,
    );
  }
}