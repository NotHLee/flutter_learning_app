import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/models/weather_model.dart';
import 'package:flutter_todo_list_app/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  List<WeatherModel>? _weatherData;

  List<WeatherModel>? get weatherData => _weatherData;

  Future<void> fetchWeather() async {
    final weatherData = await _weatherService.fetchWeather();
    _weatherData = weatherData.map((data) => WeatherModel.fromJson(data)).toList();
    notifyListeners();
  }

}