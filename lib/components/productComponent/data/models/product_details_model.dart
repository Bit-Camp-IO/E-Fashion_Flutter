import 'package:efashion_flutter/components/productComponent/data/models/product_color_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';

class ProductDetailsModel extends ProductDetails {
  const ProductDetailsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.images,
    required super.price,
    required super.colors,
    required super.sizes,
    required super.stock,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductDetailsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      images: List<String>.from(jsonData['imagesUrl']),
      price: jsonData['price'],
      colors: List<ProductColorModel>.from(
        (jsonData['colors'] as List).map(
          (productColor) => ProductColorModel.fromJson(productColor),
        ),
      ),
      sizes: List<String>.from(jsonData['sizes']),
      stock: jsonData['stock'],
    );
  }
}
