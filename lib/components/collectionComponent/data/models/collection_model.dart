import 'package:efashion_flutter/components/collectionComponent/domain/entities/collection.dart';

class CollectionModel extends Collection {
  const CollectionModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.discount,
    required super.image,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> jsonData) {
    return CollectionModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'],
      discount: jsonData['discount'],
      image: jsonData['image'],
    );
  }
}
