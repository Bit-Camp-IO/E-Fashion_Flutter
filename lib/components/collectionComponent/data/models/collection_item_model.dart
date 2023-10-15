import 'package:efashion_flutter/components/collectionComponent/domain/entities/collection_item.dart';

class CollectionItemModel extends CollectionItem {
  const CollectionItemModel({
    required super.title,
    required super.description,
    required super.image,
  });

  factory CollectionItemModel.fromJson(Map<String, dynamic> jsonData) {
    return CollectionItemModel(
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
    );
  }
}
