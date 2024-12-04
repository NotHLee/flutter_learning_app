import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/models/diet_model.dart';

class DietProvider with ChangeNotifier {
  List<DietModel> _diets = [];

  List<DietModel> get diets => _diets;

  void fetchDiets() {
    _diets = [
      DietModel(
        foodName: 'Salad',
        difficulty: Difficulty.easy,
        minutes: 10,
        calories: 150,
      ),
      DietModel(
        foodName: 'Steak',
        difficulty: Difficulty.hard,
        minutes: 30,
        calories: 500,
      ),
    ];
  }

  List<Map<String, String>> getDietsAsString() {
    return _diets.map((diet) => diet.toStringMap()).toList();
  }
 }