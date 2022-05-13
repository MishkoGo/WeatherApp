import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final _apiKey = '';

  static Future<Response> listCurrentWeather() async {
    Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat'
        ));
    if(response.statusCode == 200) {
      return response;
    }
    else {
      throw Exception("HTTP: ${response.statusCode}");
    }
  }
}