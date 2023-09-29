import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/mapComponent/domain/entities/place_data.dart';
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPlaceLatitudeAndLongitudeUseCase{
  final MapRepository _mapRepository;

  const GetPlaceLatitudeAndLongitudeUseCase(this._mapRepository);

  Future<Either<Failure, PlaceData>> call({required String placeId}) async{
    return await _mapRepository.getPlaceLatitudeAndLongitude(placeId: placeId);
  }
}