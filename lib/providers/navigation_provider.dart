import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_list_app/models/navigation_model.dart';

class NavigationProvider with ChangeNotifier {

  List<dynamic> _navigationRoutes = [];

  Future<List<NavigationModel>> get navigationRoutes async {
    if (_navigationRoutes.isEmpty) {
      await loadNavigationRoutes();
    }
    return _navigationRoutes.map((item) => NavigationModel(
      name: item["name"], 
      navigationRoute: item["navigationRoute"], 
      iconPath: item["iconPath"])
    ).toList();
  }

  Future<void> loadNavigationRoutes() async {
    final String response = await rootBundle.loadString('assets/navigation_routes.json');
    final data = await json.decode(response);
    _navigationRoutes = data["items"];
  }

  

 




}