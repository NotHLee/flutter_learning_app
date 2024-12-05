import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_list_app/models/diet_model.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            textField(),
            foodCategory(),
            dietCategory(dietProvider),
            popularCategory(dietProvider),
          ],
        ),
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
        prefixIcon: TextButton(
          onPressed: () => print("clicked"),
          child: SvgPicture.asset('assets/icons/search.svg'),
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
                TextButton(
                  onPressed: () => print("clicked"),
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

  final diets = dietProvider.diets;

  return Column(
    children: [
      HomePageText(displayText: "Recommendation for Diet"),
      SizedBox(
        height: 250, 
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              decoration: BoxDecoration(
                color: diets[index].boxColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text(
                      diets[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(diets[index].iconPath),
                      ),
                    ),
                    Text(
                      "${diets[index].calories} kJ | ${diets[index].difficulty.description} | ${diets[index].minutes} min",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => print("click"),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [Color(0xff0052d4), Color(0xff4364f7), Color(0xff6fb1fc)],
                              stops: [0, 0.5, 1],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ) 
                          ),
                          child: Center(
                            child: Text(
                              "View",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,  
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 25,),
          itemCount: diets.length,
        ),
      )
    ],
  );
}

Column popularCategory(DietProvider dietProvider) { 

  final popularDiets = dietProvider.popularDiets;

  return Column(
    children: [
      HomePageText(displayText: "Popular"),
      ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow:[
              BoxShadow(
                color: Color.fromRGBO(149, 157, 165, 0.2),
                blurRadius: 24,
                spreadRadius: 0,
                offset: Offset(0,8,),
              ),
            ]
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10), 
                      child: SizedBox(
                        height: 75,
                        width: 75,
                        child: SvgPicture.asset(popularDiets[index].iconPath)
                      )
                    ),
                    VerticalDivider(
                      thickness: 4,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            popularDiets[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                          Text(
                            "${popularDiets[index].calories} kJ | ${popularDiets[index].difficulty.description} | ${popularDiets[index].minutes} min",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.5)
                              ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: TextButton(
                    onPressed: () => print("clicked"),
                    child: SvgPicture.asset('assets/icons/arrow_circle_right.svg')
                  ),
                )
              ],
            ),
          )
        ),
        separatorBuilder: (context, index) => SizedBox(height: 15,),
        itemCount: popularDiets.length
      ),
      SizedBox(height: 15,),
    ],
  );
}
