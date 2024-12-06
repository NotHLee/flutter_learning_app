import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_todo_list_app/services/weather_service.dart';

Future<void> main() async {

  // map to store unique location_id to location_name
  Map<String, String> locationMapping = {};
  
  // fetch data from api
  List<dynamic> data = await WeatherService().fetchWeather();

  // convert it into a json containing location name to id mapping
  for (var entry in data) {
    String locationId = entry['location']['location_id'];
    String locationName = entry['location']['location_name'];
    locationMapping.putIfAbsent(locationId, () => locationName);
  }

  // convert to json string
  String jsonString = jsonEncode(locationMapping);

  // save file
  File file = File('C:/Users/Hao Yang/Documents/GitHub/flutter_todo_list_app/assets/location_id_mapping.json');
  await file.writeAsString(jsonString);

  log(jsonString);
}