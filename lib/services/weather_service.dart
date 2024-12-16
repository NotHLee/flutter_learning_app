import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {

  final String apiUrl = 'https://api.data.gov.my/weather/forecast';

  Future<List<Map<String, dynamic>>> fetchWeather() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}