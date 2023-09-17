import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.gender,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['id'],
      name: jsonData['name'],
      imageUrl: jsonData['imageURL'],
      gender: jsonData['gender'],
    );
  }
}
