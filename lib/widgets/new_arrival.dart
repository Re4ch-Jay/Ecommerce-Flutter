import 'package:flutter/material.dart';
import '../const/text_style.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              child: Image.network(
                fit: BoxFit.contain,
                'https://images.unsplash.com/photo-1503342296413-28a6ec3768b5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                width: double.infinity,
                height: size.height * 0.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Flexible(
              flex: 2,
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      'New Arrival'.toUpperCase(),
                      style: kWhiteCardTextStyle,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'only \$30'.toUpperCase(),
                      style: kWhiteCardTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
