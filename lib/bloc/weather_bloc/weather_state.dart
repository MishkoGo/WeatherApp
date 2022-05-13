part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState{

}
