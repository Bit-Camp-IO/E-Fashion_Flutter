import 'package:dio/dio.dart';
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticatedInterceptor extends Interceptor{
  final GetUserAccessTokenUseCase _getUserAccessTokenUseCase;
  late String userAccessToken;
  AuthenticatedInterceptor(this._getUserAccessTokenUseCase);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final getUserAccessToken = await _getUserAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    options.headers['Authorization'] = 'Bearer $userAccessToken';
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    super.onError(err, handler);
  }
}