import 'package:flutter/material.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/services/api_handler.dart';

class CartModel extends ChangeNotifier {
  final Future<List<ProductModel>> _productList = APIHandler.getAllProducts2();

  final List<ProductModel> _userCart = [];

  Future<List<ProductModel>> getProductList() {
    return _productList;
  }

  List<ProductModel> getUserCart() {
    return _userCart;
  }

  // add to cart

  void addItemToCart(ProductModel product) {
    _userCart.add(product);
    addPirce(product);
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(ProductModel product) {
    _userCart.remove(product);
    removePrice(product);
    notifyListeners();
  }

  // calculate price
  double totalPrice = 0;
  String addPirce(ProductModel productModel) {
    totalPrice += productModel.price;
    return totalPrice.toStringAsFixed(1);
  }

  String removePrice(ProductModel productModel) {
    totalPrice -= productModel.price;
    return totalPrice.toStringAsFixed(1);
  }
}
