import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserLocationUseCase{
  final MapRepository _mapRepository;
  const UpdateUserLocationUseCase(this._mapRepository);

  Future<Either<Failure, String>> call({required String userAccessToken, required double latitude, required double longitude}) async{
    return await _mapRepository.updateUserLocationUseCase(userAccessToken: userAccessToken, latitude: latitude, longitude: longitude);
  }
}