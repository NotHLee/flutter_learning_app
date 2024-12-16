import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/providers/weather_provider.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';
import 'package:intl/intl.dart';
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
      body: PageView.builder(
        itemCount: weatherData!.reports.length,
        itemBuilder: (context, index) {
          final report = weatherData.reports.reversed.toList()[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        DateFormat('d MMMM yyyy').format(report.date),
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTempCard('Min Temp', '${report.minTemp}'),
                  buildTempCard('Mean Temp', '${report.meanTemp}'),
                  buildTempCard('Max Temp', '${report.maxTemp}')
                ]
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildForecastCards('Morning', report.morningForecast),
                      buildForecastCards('Afternoon', report.afternoonForecast),
                      buildForecastCards('Night', report.nightForecast),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      )
    );
  }
}

Widget buildTempCard(String header, String footer) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                header,
                style: TextStyle(
                  fontSize: 16
                )
              ),
              Divider(),
              Text(
                '${footer} C°',
                style: TextStyle(
                  fontSize: 16
                )
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildForecastCards(String header, String content) {
  return Expanded(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
                header,
                style: TextStyle(
                  fontSize: 16
                )
              ),
            Text(
                content,
                style: TextStyle(
                  fontSize: 16
                )
              ),
          ],
        ),
      ),
    ),
  );
}

