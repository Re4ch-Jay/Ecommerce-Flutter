import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel productModelProvider =
        Provider.of<ProductModel>(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            id: productModelProvider.id.toString(),
          ),
        ),
      ),
      child: Card(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                child: Image.network(productModelProvider.image.toString()),
              ),
            ),
            Text(productModelProvider.title.toString()),
            Text('\$${productModelProvider.price.toString()}'),
          ],
        ),
      ),
    );
  }
}
