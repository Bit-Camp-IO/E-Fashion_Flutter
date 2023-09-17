import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';

class BrandModel extends Brand {
  const BrandModel({required super.id, required super.name});

  factory BrandModel.fromJson(Map<String, dynamic> jsonData) {
    return BrandModel(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }
}
