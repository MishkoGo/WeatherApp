import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/weather_data.dart';

class WeatherService {
  static String _apiKey = "e9eda5302835b0633b8afdd5e6dfcc55";

  static Future<WeatherData> fetchCurrentWeather({query, String lat = "", String lon =""}) async {
    final Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
       Exception('Failed to load weather');
       print("Rfgtw");
    }
  }
  static Future<List<WeatherData>> fetchHourlyWeather({query, String lat = "", String lon =""}) async {
    final Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<WeatherData> data = (jsonData['list'] as List<dynamic>)
          .map((item) {
        return WeatherData.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}