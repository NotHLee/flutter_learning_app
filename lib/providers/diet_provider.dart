import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/models/diet_model.dart';

class DietProvider with ChangeNotifier {
  List<DietModel> _diets = [];

  List<DietModel> get diets => _diets;

  void fetchDiets() {
    _diets = [
      DietModel(
        name: 'Yogurt',
        iconPath: 'assets/icons/yogurt.svg',
        boxColor: Colors.blue,
        difficulty: Difficulty.easy,
        minutes: 10,
        calories: 150,
      ),
      DietModel(
        name: 'Cereal',
        iconPath: 'assets/icons/cereal.svg',
        boxColor: Colors.orange,
        difficulty: Difficulty.easy,
        minutes: 5,
        calories: 200,
      ),
      DietModel(
        name: 'Eggs',
        iconPath: 'assets/icons/eggs.svg',
        boxColor: Colors.yellow,
        difficulty: Difficulty.medium,
        minutes: 15,
        calories: 250,
      ),
      DietModel(
        name: 'Pancakes',
        iconPath: 'assets/icons/pancake.svg',
        boxColor: Colors.brown,
        difficulty: Difficulty.hard,
        minutes: 20,
        calories: 350,
      ),
    ];
  }
 }