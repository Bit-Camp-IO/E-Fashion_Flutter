import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/entities/collection.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/entities/collection_item.dart';
import 'package:efashion_flutter/shared/error/failure.dart';

abstract class CollectionRepository{
  Future<Either<Failure, List<Collection>>> getCollectionsList();
  Future<Either<Failure, List<CollectionItem>>> getCollectionItems({required String collectionId});
}