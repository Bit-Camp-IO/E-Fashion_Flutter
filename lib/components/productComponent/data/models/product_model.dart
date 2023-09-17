import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.oldPrice,
    required super.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      oldPrice: jsonData['oldPrice'],
      imageUrl: jsonData['imageUrl'],
    );
  }
}
