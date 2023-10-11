import 'package:efashion_flutter/components/cartComponent/data/models/cart_product_model.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required super.products,
    required super.subTotal,
    required super.tax,
    required super.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
      products: List<CartProductModel>.from(
        (jsonData['items'] as List).map(
          (product) => CartProductModel.fromJson(product),
        ),
      ),
      subTotal: jsonData['subtotal'],
      tax: jsonData['tax'],
      total: jsonData['total'],
    );
  }
}
