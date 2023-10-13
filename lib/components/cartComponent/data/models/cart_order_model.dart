import 'package:efashion_flutter/components/cartComponent/domain/entities/cart_order.dart';

class CartOrderModel extends CartOrder {
  const CartOrderModel({
    required super.id,
    required super.totalPrice,
    required super.totalQuantity,
    required super.status,
  });

  factory CartOrderModel.fromJson(Map<String, dynamic> jsonData) {
    return CartOrderModel(
      id: jsonData['id'],
      totalPrice: jsonData['totalPrice'],
      totalQuantity: jsonData['totalQuantity'],
      status: jsonData['status'],
    );
  }
}
