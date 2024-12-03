import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';
import 'package:flutter_todo_list_app/models/food_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    List<FoodCategory> values = FoodCategory.values;
    print(values);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(), // Use the new widget
      body: Column(
        children: [
          textField(),
          foodCategory()
        ],
      )
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

Column foodCategory(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20, top: 30),
        child: Text(
          'Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      SizedBox(height: 15,),
      Container(
        height: 150,
        color: Colors.green,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container();
          },
        ) 
      )
    ],

  );
}