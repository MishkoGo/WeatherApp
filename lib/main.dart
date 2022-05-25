import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

import 'models/weather_data.dart';
WeatherData weather;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    // The top level function, aka callbackDispatcher
    callbackDispatcher,
  );
// Periodic task registration
  Workmanager().registerPeriodicTask(
    "2",
    "simplePeriodicTask",
    frequency: Duration(minutes: 3),
  );
  runApp(const WeatherApp());
}


void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {

    // initialise the plugin of flutterlocalnotifications.
    FlutterLocalNotificationsPlugin flip = new FlutterLocalNotificationsPlugin();

    // app_icon needs to be a added as a drawable
    // resource to the Android head project.
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');

    // initialise settings for both Android and iOS device.
    var settings = new InitializationSettings(android: android);
    flip.initialize(settings);
    _showNotificationWithDefaultSound(flip);
    return Future.value(true);
  });
}

Future _showNotificationWithDefaultSound(flip) async {

// Show a notification after every 15 minute with the first
// appearance happening a minute after invoking the method
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high
  );

// initialise channel platform for both Android and iOS device.
  var platformChannelSpecifics = new NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );
  await flip.show("HEllo",
      "weather.temp",
      platformChannelSpecifics, payload: 'Default_Sound'
  );
}
