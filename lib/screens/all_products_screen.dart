import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/services/api_handler.dart';
import 'package:shopping_app/widgets/app_bar_icon.dart';
import 'package:shopping_app/widgets/app_bar_title.dart';
import 'package:shopping_app/widgets/product_list.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductModel> productList = [];
  int limit = 10;

  @override
  void didChangeDependencies() {
    getProduct();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        limit += 10;
        await getProduct();
      }
    });
    super.didChangeDependencies();
  }

  Future<void> getProduct() async {
    productList = await APIHandler.getAllProducts(limit: limit.toString());
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(
          title: 'All Products',
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
      body: Column(
        children: [
          Expanded(
            child: productList.isNotEmpty
                ? SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          FutureBuilder<List<ProductModel>>(
                            future: APIHandler.getAllProducts(
                                limit: limit.toString()),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error ${snapshot.error}'),
                                );
                              } else if (snapshot.data == null) {
                                return const Center(
                                  child: Text('No Data'),
                                );
                              }
                              return ProductList(
                                productList: snapshot.data!,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}
