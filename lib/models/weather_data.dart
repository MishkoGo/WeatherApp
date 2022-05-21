class WeatherData {
  final String icon;
  final String name;
  final double temp;
  final DateTime time;
  final String sys;
  final double wind;
  final int humidity;

  WeatherData({
     this.humidity,
     this.wind,
     this.temp,
     this.icon,
     this.name,
     this.time,
     this.sys,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      icon: json['weather'][0]['icon'],
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      sys: json['sys']['country'],
      wind: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
    );
  }
}
