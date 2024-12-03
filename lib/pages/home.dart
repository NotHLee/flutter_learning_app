import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Breakfast',
          style: TextStyle(
            fontWeight: FontWeight.w800
          )
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => print("button back"),
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/arrow_back.svg',
              height: 20,
              width: 20,
            )
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => print("dots"),
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                height: 20,
                width: 20,
              )
            ),
          )
        ],
      )

      
    );
  }
}

