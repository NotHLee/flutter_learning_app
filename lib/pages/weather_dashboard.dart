import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/providers/weather_provider.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class WeatherDashboard extends StatelessWidget {

  final String locationId;
  final String locationName;

  const WeatherDashboard({super.key, required this.locationId, required this.locationName});

  @override
  Widget build(BuildContext context) {

    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weatherData = weatherProvider.weatherData?[locationId];

    return Scaffold(
      appBar: CustomAppBar(title: locationName),
      body: Text(weatherData!.reports[1].maxTemp.toString())
    );
  }
}