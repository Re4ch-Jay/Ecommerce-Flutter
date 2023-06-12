import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> productList;
  const ProductList({
    super.key,
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: productList[index],
          child: const ProductCard(),
        );
      },
    );
  }
}
