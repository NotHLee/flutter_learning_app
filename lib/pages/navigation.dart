import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Navigation",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 10,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => Navigator.pushNamed(context, '/homepage'),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Text(
                            "Breakfast App UI",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18  
                            ),
                          ),
                        ),
                        Expanded(child: 
                          Padding(
                            padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                            child: SvgPicture.asset('assets/icons/salad.svg'),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }
}