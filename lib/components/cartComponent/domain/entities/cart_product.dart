import 'package:equatable/equatable.dart';

class CartProduct extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String? size;
  final String? color;
  final int price;
  final int totalPrice;
  final int quantity;
  final int stock;

  const CartProduct({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.size,
    this.color,
    required this.quantity,
    required this.stock,
    required this.price,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        size,
        color,
        quantity,
        stock,
        price,
        totalPrice,
      ];
}
