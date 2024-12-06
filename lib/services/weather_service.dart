import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {

  final String apiUrl = 'https://api.data.gov.my/weather/forecast';

  Future<List> fetchWeather() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}