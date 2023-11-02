import 'package:dio/dio.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/api/authenticated_interceptor.dart';
import 'package:efashion_flutter/shared/api/dio_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Named(ApiConstants.unAuthenticatedConsumer)
  @lazySingleton
  ApiConsumer get mainApiConsumer => DioApiConsumer(
        dioClient: Dio(),
        baseUrl: ApiConstants.baseUrl,
      );
  @Named(ApiConstants.authenticatedConsumer)
  @lazySingleton
  ApiConsumer get authenticatedApiConsumer => DioApiConsumer(
    dioClient: Dio(),
    baseUrl: ApiConstants.baseUrl,
    interceptor: getIt<AuthenticatedInterceptor>(),
  );
  @Named(ApiConstants.mapsConsumerName)
  @lazySingleton
  ApiConsumer get mapsApiConsumer => DioApiConsumer(
        dioClient: Dio(),
        baseUrl: ApiConstants.mapsBaseUrl,
      );

}
