import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  const AppBarTitle({
    super.key,
    required this.title,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        letterSpacing: 1.2,
      ),
    );
  }
}
