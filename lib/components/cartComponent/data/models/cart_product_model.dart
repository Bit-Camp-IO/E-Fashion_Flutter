import 'package:efashion_flutter/components/cartComponent/domain/entities/cart_product.dart';

class CartProductModel extends CartProduct {
  const CartProductModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.size,
    required super.quantity,
    required super.stock,
    required super.price,
    required super.totalPrice,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> jsonData) {
    return CartProductModel(
      id: jsonData['productId'],
      title: jsonData['title'],
      imageUrl: jsonData['imageUrl'],
      size: jsonData['size'],
      quantity: jsonData['quantity'],
      stock: jsonData['stock'],
      price: jsonData['price'],
      totalPrice: jsonData['totalPrice'],
    );
  }
}
