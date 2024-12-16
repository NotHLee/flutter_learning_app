import 'package:flutter/material.dart';

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
    );
  }
}