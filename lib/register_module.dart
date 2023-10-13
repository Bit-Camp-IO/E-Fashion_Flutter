import 'package:dio/dio.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/api/dio_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named(ApiConstants.mainConsumerName)
  @lazySingleton
  ApiConsumer get mainApiConsumer => DioApiConsumer(
        dioClient: Dio(),
        baseUrl: ApiConstants.baseUrl,
      );

  @Named(ApiConstants.mapsConsumerName)
  @lazySingleton
  ApiConsumer get mapsApiConsumer => DioApiConsumer(
        dioClient: Dio(),
        baseUrl: ApiConstants.mapsBaseUrl,
      );
}
