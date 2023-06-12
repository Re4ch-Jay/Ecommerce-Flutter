import 'package:flutter/material.dart';
import 'package:shopping_app/const/text_style.dart';
import 'package:shopping_app/screens/all_products_screen.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/category_screen.dart';
import 'package:shopping_app/widgets/app_bar_icon.dart';
import 'package:shopping_app/widgets/app_bar_title.dart';
import 'package:shopping_app/widgets/new_arrival.dart';
import 'package:shopping_app/widgets/privacy_policy.dart';
import 'package:shopping_app/widgets/promotion_banner.dart';
import 'package:shopping_app/widgets/sale_banner.dart';
import 'package:shopping_app/widgets/shipping_banner.dart';
import 'package:shopping_app/widgets/shop_location_info.dart';
import 'package:shopping_app/widgets/social_media.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcon(
          icon: Icons.menu,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              )),
        ),
        centerTitle: true,
        title: const AppBarTitle(
          title: 'Erigo',
          fontSize: 35,
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Products',
                  style: kBlackTextStyle,
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllProductsScreen(),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SaleBanner(),
                    NewArrival(size: size),
                    const PromotionBanner(),
                    const ShippingBanner(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: size.height * 0.2,
                        child: Center(
                          child: Column(
                            children: const [
                              SocialMedia(),
                              ShopLocationInfo(),
                              PrivacyPolicy(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
