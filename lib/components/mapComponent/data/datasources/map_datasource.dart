import 'package:efashion_flutter/components/mapComponent/data/models/place_data_model.dart';
import 'package:efashion_flutter/components/mapComponent/data/models/place_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
abstract class MapDataSource {
 Future<List<PlaceModel>> getPlacesSuggestions({required String searchQuery});
 Future<PlaceDataModel> getPlaceLatitudeAndLongitude({required String placeId});
 Future<PlaceDataModel> getUserLocationUseCase();
 Future<String> updateUserLocationUseCase({required double latitude, required double longitude});
}

@LazySingleton(as: MapDataSource)
class MapDataSourceImpl extends MapDataSource {
  final ApiConsumer _mainApiConsumer;
  final ApiConsumer _mapApiConsumer;

  final googleMapsKey = dotenv.env["GOOGLE_MAPS_KEY"]!;

  MapDataSourceImpl(
    @Named(ApiConstants.authenticatedConsumer) this._mainApiConsumer,
    @Named(ApiConstants.mapsConsumerName) this._mapApiConsumer,
  );

  @override
  Future<List<PlaceModel>> getPlacesSuggestions({required String searchQuery}) async{
    final response = await _mapApiConsumer.get(ApiConstants.mapPlaceAutoComplete, queryParameters: {
      'input' : searchQuery,
      'radius' : 500,
      'key' : googleMapsKey,
    });
    return List<PlaceModel>.from((response['predictions'] as List).map((place) => PlaceModel.fromJson(place)));
  }

  @override
  Future<PlaceDataModel> getPlaceLatitudeAndLongitude({required String placeId}) async{
    final response = await _mapApiConsumer.get(ApiConstants.mapPlaceDetails, queryParameters: {
      'place_id' : placeId,
      'radius' : 500,
      'key' : googleMapsKey,
    });
    return PlaceDataModel.fromJson(response['result']['geometry']['location']);
  }

  @override
  Future<PlaceDataModel> getUserLocationUseCase() async{
    final response = await _mainApiConsumer.get(ApiConstants.addressEndPoint);
    if(response['status'] == ApiCallStatus.success.value){
      return PlaceDataModel.fromJson(response['data']['location']);
    }else{
      throw const FetchDataException();
    }
  }

  @override
  Future<String> updateUserLocationUseCase({required double latitude, required double longitude}) async{
    final response = await _mainApiConsumer.post(ApiConstants.addressEndPoint,
      body: {
        "latitude" : latitude,
        "longitude" : longitude
      }
    );
    if(response['status'] == ApiCallStatus.success.value){
      return 'Success! Your Location Updated.';
    }else{
      throw const FetchDataException();
    }
  }
}
