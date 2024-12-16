import 'package:flutter_todo_list_app/models/weather_model.dart';

class WeatherDataTransformer {
  static Map<String, Location> transformWeatherData(List<Map<String, dynamic>> apiResponse) {
    final locationMap = <String, Location>{};

    for (final data in apiResponse) {
      final locationId = data['location']['location_id'] as String;
      final locationName = data['location']['location_name'] as String;

      final report = WeatherModel(
        date: DateTime.parse(data['date']),
        minTemp: data['min_temp'].toDouble(),
        maxTemp: data['max_temp'].toDouble(),
        meanTemp: (data['min_temp'].toDouble() + data['max_temp'].toDouble()) / 2,
        morningForecast: data['morning_forecast'],
        afternoonForecast: data['afternoon_forecast'],
        nightForecast: data['night_forecast'],
        summaryForecast: data['summary_forecast'],
        summaryWhen: data['summary_when']
      );

      if (locationMap.containsKey(locationId)) {
        locationMap[locationId]!.reports.add(report);
      } else {
        locationMap[locationId] = Location(
          locationId: locationId,
          locationName: locationName,
          reports: [report],
        );
      }
    }

    return locationMap;
  }
}