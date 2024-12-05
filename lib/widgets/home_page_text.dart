import 'package:flutter/material.dart';

class HomePageText extends StatelessWidget {

  final String displayText;

  const HomePageText({
    super.key,
    required this.displayText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left:20, bottom:20),
        child: Text(
          displayText,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
    );
  }
}