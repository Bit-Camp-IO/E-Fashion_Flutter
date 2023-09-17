import 'package:efashion_flutter/components/productComponent/domain/entities/product_color.dart';

class ProductColorModel extends ProductColor {
  const ProductColorModel({required super.name, required super.hex});

  factory ProductColorModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductColorModel(
      name: jsonData['name'],
      hex: jsonData['hex'],
    );
  }
}
