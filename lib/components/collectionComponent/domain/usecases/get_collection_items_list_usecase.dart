import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/entities/collection_item.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/repositories/collection_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCollectionItemsListUseCase{
  final CollectionRepository _collectionRepository;

  const GetCollectionItemsListUseCase(this._collectionRepository);

  Future<Either<Failure, List<CollectionItem>>> call({required String collectionId}) async{
    return await _collectionRepository.getCollectionItems(collectionId: collectionId);
  }
}