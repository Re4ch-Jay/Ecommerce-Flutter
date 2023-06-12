import 'package:flutter/material.dart';
import '../const/text_style.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      '50% off'.toUpperCase(),
                      style: kBrownCardTextStyle,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'For every'.toUpperCase(),
                      style: kWhiteCardTextStyle,
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'products'.toUpperCase(),
                      style: kBrownCardTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: ClipRRect(
                child: Image.network(
                  fit: BoxFit.contain,
                  'https://images.unsplash.com/photo-1610108702400-b29471f11e76?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
                  width: double.infinity,
                  height: size.height * 0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
