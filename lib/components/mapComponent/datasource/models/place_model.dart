import 'package:efashion_flutter/components/mapComponent/domain/entities/place.dart';

class PlaceModel extends Place {
  const PlaceModel({required super.id, required super.name});

  factory PlaceModel.fromJson(Map<String, dynamic> jsonData) {
    return PlaceModel(
      id: jsonData['place_id'],
      name: jsonData['description'],
    );
  }
}
