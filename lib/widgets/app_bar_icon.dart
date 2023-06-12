import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const AppBarIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: IconButton(
          onPressed: onTap,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
