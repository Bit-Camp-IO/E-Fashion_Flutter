import 'package:equatable/equatable.dart';

class CartProduct extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String size;
  final int quantity;

  const CartProduct({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.size,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id, title, imageUrl, size, quantity];
}
