import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../core/repository/weather_repository.dart';
import '../../models/weather_current.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc
    extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherLoadingState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherUpdateEvent) {
      yield WeatherLoadedState(event.weatherData);
    }
  }

}
