import 'dart:convert';
import 'package:http/http.dart' as http;

final String apiUrl = 'https://api.data.gov.my/weather/forecast?contains=Langkawi@location__location_name';

Future<void> main() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    print(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}