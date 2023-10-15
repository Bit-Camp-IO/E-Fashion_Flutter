import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/collectionComponent/data/datasources/collection_remote_datasource.dart';
import 'package:efashion_flutter/components/collectionComponent/data/models/collection_item_model.dart';
import 'package:efashion_flutter/components/collectionComponent/data/models/collection_model.dart';
import 'package:efashion_flutter/components/collectionComponent/domain/repositories/collection_repository.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CollectionRepository)
class CollectionRepositoryImpl extends CollectionRepository{
  final CollectionRemoteDataSource _collectionRemoteDataSource;
  CollectionRepositoryImpl(this._collectionRemoteDataSource);

  @override
  Future<Either<Failure, List<CollectionModel>>> getCollectionsList() async{
    try{
      final List<CollectionModel> collections = await _collectionRemoteDataSource.getCollectionsList();
      return right(collections);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<CollectionItemModel>>> getCollectionItems({required String collectionId}) async{
    try{
      final List<CollectionItemModel> collectionItems = await _collectionRemoteDataSource.getCollectionItems(collectionId: collectionId);
      return right(collectionItems);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }
}