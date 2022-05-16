import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/repository/weather_repository.dart';
import 'package:weather_app/models/weather_current.dart';
import 'package:weather_app/scenes/widgets/today_details_widget.dart';
import 'package:weather_app/scenes/widgets/week_weather_data.dart';
import '../../bloc/weather_bloc/weather_bloc.dart';
import '../../routes.dart';
import '../../service.dart';
import '../widgets/today_data_widget.dart';

class WeatherPage extends StatefulWidget {

  const WeatherPage({Key? key,}) : super(key: key);
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(124, 187, 231, 1),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadedState)
              {
               return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        TodayDataWidget(
                          currentWeather: state.weatherData,
                        ),
                        SizedBox(height: 5,),
                        TodayDetailsWidget(),
                        SizedBox(height: 15,),
                        WeekWeatherData(),
                      ],
                    ),
                  ),
                );
              } else {
              return Center (
                child: Text('data loading'),
              );
            }
          },
        ),
      );
    }
    // return BlocBuilder<CurrentWeatherDataBloc, CurrentWeatherState>(
    //     builder: (context, state) {
    //       return AnimatedSwitcher(
    //           duration: const Duration(milliseconds: 500),
    //           child: state is CurrentWeatherDataState
    //               ? buildTodayScreenLayout(state)
    //               : Container(child:Text('ff')));
    //     })

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await Service.currentWeatherResponseTransformer(context);
  }
}
