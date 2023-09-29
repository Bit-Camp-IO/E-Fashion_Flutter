import 'package:efashion_flutter/components/productComponent/domain/entities/product_color.dart';
import 'package:equatable/equatable.dart';

class ProductDetails extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final num price;
  final List<ProductColor> colors;
  final List<String> sizes;
  final int stock;

  const ProductDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.colors,
    required this.sizes,
    required this.stock,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        images,
        price,
        colors,
        sizes,
        stock,
      ];
}
