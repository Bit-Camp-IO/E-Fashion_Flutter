import 'package:efashion_flutter/components/mapComponent/datasource/models/place_data_model.dart';
import 'package:efashion_flutter/components/mapComponent/datasource/models/place_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:injectable/injectable.dart';

abstract class MapDataSource {
 Future<List<PlaceModel>> getPlacesSuggestions({required String searchQuery});
 Future<PlaceDataModel> getPlaceLatitudeAndLongitude({required String placeId});
}

@LazySingleton(as: MapDataSource)
class MapDataSourceImpl extends MapDataSource {
  final ApiConsumer _mainApiConsumer;
  final ApiConsumer _mapApiConsumer;

  MapDataSourceImpl(
    @Named(ApiConstants.mainConsumerName) this._mainApiConsumer,
    @Named(ApiConstants.mapsConsumerName) this._mapApiConsumer,
  );

  @override
  Future<List<PlaceModel>> getPlacesSuggestions({required String searchQuery}) async{
    final response = await _mapApiConsumer.get(ApiConstants.mapPlaceAutoComplete, queryParameters: {
      'input' : searchQuery,
      'radius' : 500,
      'key' : ApiConstants.googleMapsKey,
    });
    return List<PlaceModel>.from((response['predictions'] as List).map((place) => PlaceModel.fromJson(place)));
  }

  @override
  Future<PlaceDataModel> getPlaceLatitudeAndLongitude({required String placeId}) async{
    final response = await _mapApiConsumer.get(ApiConstants.mapPlaceDetails, queryParameters: {
      'place_id' : placeId,
      'radius' : 500,
      'key' : ApiConstants.googleMapsKey,
    });
    return PlaceDataModel.fromJson(response['result']['geometry']['location']);
  }


}
