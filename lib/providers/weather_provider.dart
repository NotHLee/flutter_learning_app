import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/models/weather_model.dart';
import 'package:flutter_todo_list_app/services/weather_service.dart';
import 'package:flutter_todo_list_app/utils/weather_data_transformer.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Map<String, Location>? _weatherData;
  bool _isLoading = false;
  String? _error;

  Map<String, Location>? get weatherData => _weatherData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchWeather() async {
    try {
      final weatherData = await _weatherService.fetchWeather();
      _weatherData = WeatherDataTransformer.transformWeatherData(weatherData);
      _error = null;
    } catch (e) {
      _error = e.toString();
      _weatherData = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    _weatherData = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }

}