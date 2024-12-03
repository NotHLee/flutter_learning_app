import 'package:flutter/material.dart';
import 'category_model.dart';

enum FoodCategory implements CategoryModel {
  salad(
    name: 'Salad',
    iconPath: 'assets/icons/salad.svg',
    boxColor: Colors.green,
  ),

  sausage(
    name: 'Sausage',
    iconPath: 'assets/icons/sausage.svg',
    boxColor: Colors.orange,
  ),

  noodles(
    name: 'Noodles',
    iconPath: 'assets/icons/noodle.svg',
    boxColor: Colors.red,
  ),

  rice(
    name: 'Rice',
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