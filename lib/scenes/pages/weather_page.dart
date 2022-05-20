import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_test/scenes/pages/weather_main.dart';
import '../../bloc/weather_bloc/weather_bloc.dart';
import '../widgets/search.dart';

class WeatherPage extends StatefulWidget {

  const WeatherPage({Key key,}) : super(key: key);
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 50, 81, 1),
      appBar: AppBar(
          backgroundColor:  Color.fromRGBO(41, 50, 81, 12),
          title: Text('Weather', style: TextStyle(color: Colors.white,)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed:() {
                showSearch(
                    context: context, delegate: MySearchDelegate((query) {
                  BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: query));
                }));
              },
            ),
          ]
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return Scaffold(
              backgroundColor: Color.fromRGBO(41, 50, 81, 1),
              body: Padding(
                padding: EdgeInsets.all(25.0),
                   child: MainScreenWrapper(
                        weather: state.weather, hourlyWeather: state.hourlyWeather),
                ),
              );
          }
          return const Center(
               child: CircularProgressIndicator(),
            );
         },
      ),
    );
  }
}
