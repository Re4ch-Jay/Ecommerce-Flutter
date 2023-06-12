import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Follow Us'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.facebook),
              Icon(Icons.tiktok),
            ],
          )
        ],
      ),
    );
  }
}
