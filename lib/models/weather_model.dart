class Location {
  final String locationId;
  final String locationName;
  final List<WeatherModel> reports;

  const Location({
    required this.locationId, 
    required this.locationName,
    required this.reports,
  });
}

class WeatherModel {
  final DateTime date;
  final String morningForecast;
  final String afternoonForecast;
  final String nightForecast;
  final String summaryForecast;
  final String summaryWhen;
  final double minTemp;
  final double maxTemp;
  final double meanTemp;

  const WeatherModel ({
    required this.date,
    required this.morningForecast,
    required this.afternoonForecast,
    required this.nightForecast,
    required this.summaryForecast,
    required this.summaryWhen,
    required this.minTemp,
    required this.maxTemp,
    required this.meanTemp,
  });
}