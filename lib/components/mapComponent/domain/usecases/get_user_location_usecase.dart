import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/mapComponent/domain/entities/place_data.dart';
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserLocationUseCase{
  final MapRepository _mapRepository;
  const GetUserLocationUseCase(this._mapRepository);

  Future<Either<Failure, PlaceData>> call() async{
    return await _mapRepository.getUserLocationUseCase();
  }
}