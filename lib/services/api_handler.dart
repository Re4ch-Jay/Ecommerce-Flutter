import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData(
      {required String target, String? limit}) async {
    Uri uri = Uri.https('fakestoreapi.com', target,
        target == 'products' ? {'limit': limit} : {});
    var response = await http.get(uri);

    var data = jsonDecode(response.body);

    var tempList = [];
    for (var eachData in data) {
      tempList.add(eachData);
    }
    return tempList;
  }

  static Future<List<ProductModel>> getAllProducts(
      {required String limit}) async {
    List tempList = await getData(target: 'products', limit: limit);
    return ProductModel.productsFromSnapshot(tempList);
  }

  static Future<List<ProductModel>> getAllProducts2() async {
    List tempList = await getData(target: 'products');
    return ProductModel.productsFromSnapshot(tempList);
  }

  static Future<ProductModel> getSingleProductById({required String id}) async {
    Uri uri = Uri.http('fakestoreapi.com', 'products/$id');
    var response = await http.get(uri);

    var data = jsonDecode(response.body);
    return ProductModel.fromJson(data);
  }
}
