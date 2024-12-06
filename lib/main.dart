import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/pages/navigation.dart';
import 'package:flutter_todo_list_app/pages/weather.dart';
import 'package:flutter_todo_list_app/providers/diet_provider.dart';
import 'package:flutter_todo_list_app/providers/navigation_provider.dart';
import 'package:flutter_todo_list_app/providers/weather_provider.dart';
import 'package:provider/provider.dart';
import './pages/home.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DietProvider()),
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ChangeNotifierProvider(create: (_) => WeatherProvider()),
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavigationPage(),
      routes: {
        '/navigation': (context) => NavigationPage(),
        '/homepage': (context) => HomePage(),
        '/weather': (context) => WeatherPage(),
      },
    );
  }
}
