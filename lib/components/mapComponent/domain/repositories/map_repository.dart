import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/mapComponent/domain/entities/place.dart';
import 'package:efashion_flutter/components/mapComponent/domain/entities/place_data.dart';
import 'package:efashion_flutter/shared/error/failure.dart';

abstract class MapRepository{
  Future<Either<Failure, List<Place>>> getPlacesSuggestions({required String searchQuery});
  Future<Either<Failure, PlaceData>> getPlaceLatitudeAndLongitude({required String placeId});
}