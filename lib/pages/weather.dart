import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Weather'),
      
    );
  }
}