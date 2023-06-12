import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/services/api_handler.dart';
import 'package:shopping_app/widgets/app_bar_icon.dart';
import 'package:shopping_app/widgets/app_bar_title.dart';

class ProductDetailScreen extends StatefulWidget {
  final String id;
  const ProductDetailScreen({super.key, required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(
          title: 'Detail Product',
          fontSize: 20,
        ),
        actions: [
          AppBarIcon(
            icon: Icons.shopping_cart_outlined,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              FutureBuilder(
                future: APIHandler.getSingleProductById(id: widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data == null) {
                    return const Center(
                      child: Text('No Data'),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error ${snapshot.error}'),
                    );
                  }

                  return Column(
                    children: [
                      ClipRect(
                          child: Image.network(
                        snapshot.data!.image.toString(),
                        height: size.height * 0.5,
                        width: double.infinity,
                      )),
                      Text(
                        snapshot.data!.title.toString(),
                        style: const TextStyle(
                          color: Colors.brown,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                            child: Text(
                              '\$${snapshot.data!.price.toString()}',
                              style: TextStyle(
                                color: Colors.green[600],
                                fontSize: 18,
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              'Rating: ${snapshot.data!.rating!.rate.toString()}',
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(snapshot.data!);
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text('Successfully Added To Cart'),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Icon(Icons.add),
                        ),
                      ),
                      const FittedBox(
                          child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Text(
                        snapshot.data!.description.toString(),
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
                      ),
                    ],
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
