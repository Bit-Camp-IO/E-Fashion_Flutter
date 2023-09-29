import 'package:efashion_flutter/components/mapComponent/domain/entities/place_data.dart';

class PlaceDataModel extends PlaceData {
  const PlaceDataModel({required super.latitude, required super.longitude});

  factory PlaceDataModel.fromJson(Map<String, dynamic> jsonData) {
    return PlaceDataModel(
      latitude: jsonData['lat'],
      longitude: jsonData['lng'],
    );
  }
}
