import 'package:flutter_todo_list_app/models/category_model.dart';

enum Difficulty {
  easy,
  medium,
  hard
}

extension DifficultyExtension on Difficulty {
  String get description {
    switch (this) {
      case Difficulty.easy:
        return "Easy";
      case Difficulty.medium:
        return "Medium";
      case Difficulty.hard:
        return "Hard";
      default:
        return "Invalid";
    }
  }
}

class DietModel extends CategoryModel {
  Difficulty difficulty;
  int minutes;
  int calories;
  bool isPopular;

  DietModel({
    required super.name,
    required super.iconPath,
    required super.boxColor,
    required this.difficulty,
    required this.minutes,
    required this.calories,
    this.isPopular = false,
  });

}