import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/pages/navigation.dart';
import 'package:flutter_todo_list_app/providers/diet_provider.dart';
import 'package:provider/provider.dart';
import './pages/home.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DietProvider())
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
      },
    );
  }
}
