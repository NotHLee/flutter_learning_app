import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/api/firebase_api.dart';
import 'package:flutter_todo_list_app/firebase_options.dart';
import 'package:flutter_todo_list_app/pages/message.dart';
import 'package:flutter_todo_list_app/pages/navigation.dart';
import 'package:flutter_todo_list_app/pages/weather.dart';
import 'package:flutter_todo_list_app/providers/diet_provider.dart';
import 'package:flutter_todo_list_app/providers/navigation_provider.dart';
import 'package:flutter_todo_list_app/providers/weather_provider.dart';
import 'package:provider/provider.dart';
import './pages/home.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  
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
      navigatorKey: navigatorKey,
      routes: {
        '/navigation': (context) => NavigationPage(),
        '/homepage': (context) => HomePage(),
        '/weather': (context) => WeatherPage(),
        '/message': (context) => MessagePage(),
      },
    );
  }
}
