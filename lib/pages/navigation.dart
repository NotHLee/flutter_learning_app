import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_list_app/models/navigation_model.dart';
import 'package:flutter_todo_list_app/providers/navigation_provider.dart';
import 'package:flutter_todo_list_app/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  @override
  Widget build(BuildContext context) {

    NavigationProvider navigationProvider = Provider.of<NavigationProvider>(context);

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
      body: FutureBuilder(
        future: navigationProvider.navigationRoutes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'),);
          } else if (!snapshot.hasData) {
            return Center(child: Text('No navigation routes available'),);
          } else {
            List<NavigationModel> routes = snapshot.data!;
            return GridView.count (
              crossAxisCount: 2,
              children: routes
              .where((route) => route.iconPath != null && route.iconPath!.isNotEmpty)
              .map((route) {
                return NavigationGridTile(
                  iconPath: route.iconPath!,
                  navigationRoute: route.navigationRoute,
                  name: route.name);
                }
              ).toList()
            );
          }
        }
      )
    );
  }
}

class NavigationGridTile extends StatelessWidget {

  final String name;
  final String navigationRoute;
  final String iconPath;

  const NavigationGridTile({
    super.key,
    required this.iconPath,
    required this.navigationRoute,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 10,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pushNamed(context, navigationRoute),
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
      );
  }
}