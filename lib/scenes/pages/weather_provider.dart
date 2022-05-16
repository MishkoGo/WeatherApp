import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/scenes/pages/weather_page.dart';

import '../../core/repository/weather_repository.dart';

class WeatherProvider extends StatelessWidget {
  const WeatherProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherBloc(),
        child: WeatherPage(),
    );
  }
}
