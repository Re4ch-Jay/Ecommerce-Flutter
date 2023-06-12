import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/widgets/app_bar_title.dart';

import '../widgets/app_bar_icon.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(
          title: 'Categories',
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
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) => const ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.amber,
              ),
              title: Text('Shirt'),
              subtitle: Text('Outlet Quality'),
            ),
          ),
        )
      ]),
    );
  }
}
