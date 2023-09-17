import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final num price;
  final num oldPrice;
  final String imageUrl;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, price, oldPrice, imageUrl];

  Product copyWith({
    String? id,
    String? title,
    num? price,
    num? oldPrice,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
