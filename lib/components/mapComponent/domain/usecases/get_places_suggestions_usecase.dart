import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/mapComponent/domain/entities/place.dart';
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPlacesSuggestionsUseCase{
  final MapRepository _mapRepository;
  const GetPlacesSuggestionsUseCase(this._mapRepository);
  Future<Either<Failure, List<Place>>> call({required String searchQuery}) async{
    return await _mapRepository.getPlacesSuggestions(searchQuery: searchQuery);
  }
}