import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/entities/collection.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/repositories/collection_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCollectionsListUseCase{
  final CollectionRepository _collectionRepository;

  const GetCollectionsListUseCase(this._collectionRepository);

  Future<Either<Failure, List<Collection>>> call() async{
    return await _collectionRepository.getCollectionsList();
  }
}