enum Difficulty {
  easy,
  medium,
  hard
}

class DietModel {

  String foodName;
  Difficulty difficulty;
  int minutes;
  int calories;

  DietModel({
    required this.foodName,
    required this.difficulty,
    required this.minutes,
    required this.calories
  });

  Map<String, String> toStringMap() {

    String difficultyString;

    switch (difficulty) {
      case Difficulty.easy:
        difficultyString = "Easy";
        break;
      case Difficulty.medium:
        difficultyString = "Medium";
        break;
      case Difficulty.hard:
        difficultyString = "Hard";
        break;
      default:
        difficultyString = "Invalid";
    }

    return {
      'foodName': foodName,
      'difficulty': difficultyString,
      'minutes': minutes.toString(),
      'calories': calories.toString()
    };
  }
}

