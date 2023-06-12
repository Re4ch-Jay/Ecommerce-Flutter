import 'package:flutter/material.dart';

class ShopLocationInfo extends StatelessWidget {
  const ShopLocationInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.home,
            size: 18,
          ),
          Text('Phnom Penh, Cambodia'),
        ],
      ),
    );
  }
}
