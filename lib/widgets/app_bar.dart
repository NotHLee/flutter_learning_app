// FILE: custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key, 
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      leading: TextButton(
        onPressed: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/arrow_back.svg',
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}