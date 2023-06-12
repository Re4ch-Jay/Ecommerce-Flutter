import 'package:flutter/material.dart';
import 'package:shopping_app/models/rating_model.dart';
import 'package:shopping_app/services/api_handler.dart';

class ProductModel extends ChangeNotifier {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? RatingModel.fromJson(json['rating']) : null;
  }

  static List<ProductModel> productsFromSnapshot(List productSnapShot) {
    return productSnapShot.map((data) {
      return ProductModel.fromJson(data);
    }).toList();
  }
}
