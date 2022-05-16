import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
 static const String apiKey = "e9eda5302835b0633b8afdd5e6dfcc55";

  static Future<Response> listCurrentWeather(double lat,
      double lon) async {
    final Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${lat
            .toString()}&lon=${lon.toString()}&appid=$apiKey&units=metric');
    final response = await http.Client().get(url);

    if (response.statusCode == 200) {
      return response;
    }
    else {
      throw Exception("HTTP: ${response.statusCode}");
    }
  }
}
