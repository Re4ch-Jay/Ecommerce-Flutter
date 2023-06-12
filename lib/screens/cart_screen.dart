import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/product_model.dart';

import '../widgets/app_bar_title.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const AppBarTitle(
            title: 'My Cart',
            fontSize: 20,
          ),
        ),
        body: value.getUserCart().isNotEmpty
            ? Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getUserCart().length,
                    itemBuilder: (context, index) {
                      ProductModel product = value.getUserCart()[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          tileColor: Colors.brown[100],
                          title: Text(
                            product.title.toString(),
                          ),
                          leading: ClipRRect(
                            child: Image.network(
                              product.image!,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          subtitle:
                              Text('Price: \$${product.price.toString()}'),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeFromCart(product),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.red,
                    padding: const EdgeInsets.all(10),
                    onPressed: () => '',
                    child: Text(
                      'Pay Now \$${value.totalPrice}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                )
              ])
            : const Center(
                child: Text('You have an empty cart'),
              ),
      ),
    );
  }
}
