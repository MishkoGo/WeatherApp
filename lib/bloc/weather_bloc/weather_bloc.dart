import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/repository/weather_repository.dart';
import '../../models/weather_data.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherLoadingState()) {
    on<WeatherRequested>(_newWeatherRequested);
    on<WeatherCurrentPositionRequested>(_newWeatherCurrentPositionRequested);
  }

   void _newWeatherRequested(WeatherRequested event, Emitter<WeatherState> emit) async {
      final WeatherData weather = await WeatherService.fetchCurrentWeather(
          query: event.city, lon: event.lon, lat: event.lat);
      final List<WeatherData> hourlyWeather =
      await WeatherService.fetchHourlyWeather(
          query: event.city, lon: event.lon, lat: event.lat);
      emit(WeatherLoadSuccess(weather: weather, hourlyWeather: hourlyWeather));
  }


  void _newWeatherCurrentPositionRequested(WeatherCurrentPositionRequested event, Emitter<WeatherState> emit) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position lastKnownPosition = await Geolocator.getLastKnownPosition();
      if(lastKnownPosition != null) {
        add(WeatherRequested(
            lat: lastKnownPosition.latitude.toString(),
            lon: lastKnownPosition.longitude.toString()));

      } else {
        Position position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        add(WeatherRequested(
            lat: position.latitude.toString(),
            lon: position.longitude.toString()));
      }
    } else {
      await Geolocator.requestPermission();
    }
  }
}