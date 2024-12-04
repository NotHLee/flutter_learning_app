import 'package:flutter/material.dart';
import 'category_model.dart';

enum FoodCategory implements CategoryModel {
  salad(
    name: 'Greek',
    iconPath: 'assets/icons/salad.svg',
    boxColor: Colors.green,
  ),

  sausage(
    name: 'German',
    iconPath: 'assets/icons/sausage.svg',
    boxColor: Colors.orange,
  ),

  noodles(
    name: 'Japanese',
    iconPath: 'assets/icons/noodle.svg',
    boxColor: Colors.red,
  ),

  rice(
    name: 'Chinese',
    iconPath: 'assets/icons/rice.svg',
    boxColor: Colors.yellow,
  );

  @override
  final String name;
  @override
  final String iconPath;
  @override
  final Color boxColor;

  const FoodCategory({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
}