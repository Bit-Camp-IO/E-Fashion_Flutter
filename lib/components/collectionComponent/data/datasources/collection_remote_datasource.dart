import 'package:efashion_flutter/components/collectionComponent/data/models/collection_item_model.dart';
import 'package:efashion_flutter/components/collectionComponent/data/models/collection_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:injectable/injectable.dart';

abstract class CollectionRemoteDataSource {
  Future<List<CollectionModel>> getCollectionsList();

  Future<List<CollectionItemModel>> getCollectionItems(
      {required String collectionId});
}

@LazySingleton(as: CollectionRemoteDataSource)
class CollectionRemoteDataSourceImpl extends CollectionRemoteDataSource {
  final ApiConsumer _apiConsumer;

  CollectionRemoteDataSourceImpl(@Named(ApiConstants.unAuthenticatedConsumer) this._apiConsumer);

  @override
  Future<List<CollectionModel>> getCollectionsList() async {
    final response =
        await _apiConsumer.get(ApiConstants.collectionsListEndPoint);
    if (response['status'] == ApiCallStatus.success.value) {
      return List<CollectionModel>.from(
        (response['data'] as List).map(
          (collection) => CollectionModel.fromJson(collection),
        ),
      );
    }else{
      throw const FetchDataException();
    }
  }

  @override
  Future<List<CollectionItemModel>> getCollectionItems({required String collectionId}) async{
    final response =
        await _apiConsumer.get(ApiConstants.getCollectionItemsEndPoint(collectionId: collectionId));
    if (response['status'] == ApiCallStatus.success.value) {
      return List<CollectionItemModel>.from(
        (response['data']['items'] as List).map(
              (collectionItem) => CollectionItemModel.fromJson(collectionItem),
        ),
      );
    }else{
      throw const FetchDataException();
    }
  }
}
