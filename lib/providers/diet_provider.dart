import 'package:flutter/material.dart';
import 'package:flutter_todo_list_app/models/diet_model.dart';

class DietProvider with ChangeNotifier {
  List<DietModel> _diets = [];

  List<DietModel> get diets => _diets;
  List<DietModel> get popularDiets => _diets.where((diet) => diet.isPopular).toList();

  void fetchDiets() {
    _diets = [
       DietModel(
        name: 'Soup',
        iconPath: 'assets/icons/soup.svg',
        boxColor: Colors.pink,
        difficulty: Difficulty.medium,
        minutes: 25,
        calories: 220,
        isPopular: true,
      ),
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
       DietModel(
        name: 'Salad',
        iconPath: 'assets/icons/salad.svg',
        boxColor: Colors.green,
        difficulty: Difficulty.easy,
        minutes: 10,
        calories: 150,
        isPopular: true,
      ),
      DietModel(
        name: 'Smoothie',
        iconPath: 'assets/icons/smoothie.svg',
        boxColor: Colors.purple,
        difficulty: Difficulty.easy,
        minutes: 5,
        calories: 180,
        isPopular: true,
      ),
      DietModel(
        name: 'Steak',
        iconPath: 'assets/icons/steak.svg',
        boxColor: Colors.red,
        difficulty: Difficulty.hard,
        minutes: 30,
        calories: 400,
        isPopular: true,
      ),
    ];
  }
 }