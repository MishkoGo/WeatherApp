class WeatherData {
  final String base;
  final int visibility;
  final int dt;
  final int timezone;
  final int id;
  final String name;
  final int cod;
  final double temp;
  final String sys;

  WeatherData({
    required this.temp,
   required this.base,
   required this.visibility,
   required this.dt,
   required this.timezone,
   required this.id,
   required this.name,
   required this.cod,
   required this.sys,
  });

  Map<String, dynamic> toJson() {
    return {
      'base': base,
      'visibility': visibility,
      'dt': dt,
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

   factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      base: json["base"],
      visibility: json['visibility'],
      dt: json['dt'],
      timezone: json['timezone'],
      id: json['id'],
      name: json["name"],
      cod: json['cod'],
      temp: json['main']['temp'].toDouble(),
      sys: json['sys']['country'],
     );
  }

}