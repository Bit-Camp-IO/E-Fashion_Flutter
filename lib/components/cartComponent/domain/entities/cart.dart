import 'package:efashion_flutter/components/cartComponent/domain/entities/cart_product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<CartProduct> products;
  final int subTotal;
  final int tax;
  final int total;

  const Cart({
    required this.products,
    required this.subTotal,
    required this.tax,
    required this.total,
  });

  @override
  List<Object?> get props => [
        products,
        subTotal,
        tax,
        total,
      ];

  Cart copyWith({
    List<CartProduct>? products,
    int? subTotal,
    int? tax,
    int? total,
  }) {
    return Cart(
      products: products ?? this.products,
      subTotal: subTotal ?? this.subTotal,
      tax: tax ?? this.tax,
      total: total ?? this.total,
    );
  }
}
