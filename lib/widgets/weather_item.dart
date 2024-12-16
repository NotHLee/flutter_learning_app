import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/pages/weather_dashboard.dart';

class WeatherItem extends StatelessWidget {

  final String locationId;
  final String locationName;

  const WeatherItem({
    required this.locationId,
    required this.locationName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(locationName),
      subtitle: Text(locationId),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherDashboard(locationId: locationId, locationName: locationName),
          )
        );
      },
    );
  }
}