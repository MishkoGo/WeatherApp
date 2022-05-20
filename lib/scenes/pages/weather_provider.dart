import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_test/scenes/pages/weather_page.dart';
import '../../bloc/weather_bloc/weather_bloc.dart';

class WeatherProvider extends StatelessWidget {
  const WeatherProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: WeatherPage(),
    );
  }
}
