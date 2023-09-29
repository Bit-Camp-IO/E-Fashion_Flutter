import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/mapComponent/datasource/datasources/map_datasource.dart';
import 'package:efashion_flutter/components/mapComponent/datasource/models/place_data_model.dart';
import 'package:efashion_flutter/components/mapComponent/datasource/models/place_model.dart';
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MapRepository)
class MapRepositoryImpl extends MapRepository{
  final MapDataSource _mapDataSource;

  MapRepositoryImpl(this._mapDataSource);
  @override
  Future<Either<Failure, List<PlaceModel>>> getPlacesSuggestions({required String searchQuery}) async{
    try{
      final List<PlaceModel> places = await _mapDataSource.getPlacesSuggestions(searchQuery: searchQuery);
      return right(places);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, PlaceDataModel>> getPlaceLatitudeAndLongitude({required String placeId}) async{
    try{
      final PlaceDataModel placeData = await _mapDataSource.getPlaceLatitudeAndLongitude(placeId: placeId);
      return right(placeData);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}