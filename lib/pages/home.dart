import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_list_app/providers/diet_provider.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';
import 'package:flutter_todo_list_app/models/food_category.dart';
import 'package:flutter_todo_list_app/widgets/home_page_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Provider.of<DietProvider>(context, listen: false).fetchDiets();
  }

  @override
  Widget build(BuildContext context) {

    final dietProvider = Provider.of<DietProvider>(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(), // Use the new widget
      body: Column(
        
        children: [
          textField(),
          foodCategory(),
          dietCategory(dietProvider),
        ],
      ),
    );
  }
}

Container textField() {
  return Container(
    margin: EdgeInsets.only(top: 40, left: 20, right: 20),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0
        )
      ]
    ),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        hintText: 'Search Pancake',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ),
        suffixIcon: SizedBox(
          width: 100,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalDivider(
                  color: Colors.black,
                  thickness: 0.1,
                  endIndent: 10,
                  indent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset('assets/icons/filter.svg'),
                ),
              ],
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Column foodCategory() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      HomePageText(displayText: "Category"),
      Container(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: FoodCategory.values.length,
          padding: EdgeInsets.only(left: 20, right: 20),
          separatorBuilder: (context, index) => SizedBox(width: 25,),
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              decoration: BoxDecoration(
                color: FoodCategory.values[index].boxColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(FoodCategory.values[index].iconPath),
                    ),
                  ),
                  Text(
                    FoodCategory.values[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ), 
    ],
  );
}

Column dietCategory(DietProvider dietProvider) {
  return Column(
    children: [
      HomePageText(displayText: "Recommendation for Diet"),
      Container(
        
      )
    ],
  );
  }
