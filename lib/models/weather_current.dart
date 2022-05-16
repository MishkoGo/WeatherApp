class WeatherData {
  late String base;
  late int visibility;
  late int dt;
  late int timezone;
  late int id;
  late String name;
  late int cod;
  late double temp;

  WeatherData({
   required this.temp,
   required this.base,
   required this.visibility,
   required this.dt,
   required this.timezone,
   required this.id,
   required this.name,
   required this.cod,
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

   WeatherData.fromJson(Map<String, dynamic> json) {
        base = json["base"];
        visibility = json['visibility'];
        dt = json['dt'];
        timezone = json['timezone'];
        id = json['id'];
        name =  json["name"];
        cod = json['cod'];
        temp = json['main']['temp'].toDouble();
  }

}