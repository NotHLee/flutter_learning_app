import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/models/weather_model.dart';
import 'package:flutter_todo_list_app/providers/weather_provider.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';
import 'package:flutter_todo_list_app/widgets/weather_item.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
  
}

class _WeatherPageState extends State<WeatherPage> {

  late Future<void> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = Provider.of<WeatherProvider>(context, listen: false).fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Weather'),
      body: FutureBuilder(
        future: _weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return Consumer<WeatherProvider>(
            builder: (context, weatherProvider, child) {
              if (weatherProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (weatherProvider.error != null) {
                return Center(child: Text('Error: ${weatherProvider.error}'));
              }

              final weatherData = weatherProvider.weatherData;
              if (weatherData == null || weatherData.isEmpty) {
                return const Center(child: Text('No weather data available'));
              }

              // sort alphabetically
              final weatherKeys = weatherData.keys.toList();
              weatherKeys.sort((a, b) {
                final locationA = weatherData[a]?.locationName ?? '';
                final locationB = weatherData[b]?.locationName ?? '';
                return locationA.compareTo(locationB);
              });

              // display ListView
              return ListView.builder(
                itemCount: weatherData.length,
                itemBuilder: (context, index) {
                  final entry = weatherData[weatherKeys[index]];
                  return WeatherItem(locationId: entry!.locationId, locationName: entry.locationName);
                },
              );
            }
          );
        }
      )
    );
  }
}