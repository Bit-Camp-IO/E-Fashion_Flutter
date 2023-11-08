import 'dart:convert';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/api/api_status_code.dart';
import 'package:efashion_flutter/shared/api/unauthenticated_interceptor.dart';
import 'package:efashion_flutter/shared/api/dio_logger.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class DioApiConsumer extends ApiConsumer {
  final Dio dioClient;
  final String baseUrl;
  final Interceptor? interceptor;
  DioApiConsumer({required this.dioClient, required this.baseUrl, this.interceptor}) {
    // Fix for dio handshake error
    (dioClient.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final dioClient = HttpClient();
      dioClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return dioClient;
    };
    // dio validation
    dioClient.options
      ..baseUrl = baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < ApiStatusCodes.internalServerError;
      };
    if(interceptor != null){
      dioClient.interceptors.add(interceptor!);
    }else{
       dioClient.interceptors.add(getIt<UnAuthenticatedInterceptor>());
    }

    if (kDebugMode) {
      dioClient.interceptors.add(getIt<DioLogInterceptor>());
    }
  }

  @override
  Future get(String endPointPath, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, }) async {
    try {
      final Response response = await dioClient.get(endPointPath, queryParameters: queryParameters, options: Options(
        headers: headers,
      ));
        return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handelDioError(error);
    }
  }

  @override
  Future post(String endPointPath, {dynamic body, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dioClient.post(endPointPath, queryParameters: queryParameters, data: body, options: Options(
        headers: headers,
      ));
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handelDioError(error);
    }
  }

  @override
  Future put(String endPointPath,
      {Map<String, dynamic>? body, bool formDataIsEnabled = false, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dioClient.put(endPointPath,queryParameters: queryParameters, data: formDataIsEnabled ? FormData.fromMap(body!) : body, options: Options(headers: headers));
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handelDioError(error);
    }
  }

  @override
  Future patch(String endPointPath, {Map<String, dynamic>? body, bool formDataIsEnabled = false, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async{
    try {
      final Response response = await dioClient.patch(endPointPath,queryParameters: queryParameters, data: formDataIsEnabled ? FormData.fromMap(body!) : body, options: Options(headers: headers));
      return _handleResponseAsJson(response);
    } on DioException catch (error) {
      _handelDioError(error);
    }
  }

  @override
  Future delete(String endPointPath, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async{
    try{
      final Response response = await dioClient.delete(endPointPath, queryParameters: queryParameters, data: body, options: Options(headers: headers));
      return _handleResponseAsJson(response);
    } on DioException catch(error){
      _handelDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    if(response.data.toString().isNotEmpty){
      final responseJson = jsonDecode(response.data.toString());
      return responseJson;
    }else{
      return response;
    }
  }

  dynamic _handelDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw const NoInternetConnectionException();
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
      case DioExceptionType.sendTimeout:
        throw const NoInternetConnectionException();
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ApiStatusCodes.badRequest:
            throw const BadRequestException();
          case ApiStatusCodes.unauthorized:
          case ApiStatusCodes.forbidden:
            throw const UnauthorizedException();
          case ApiStatusCodes.notFound:
            throw const NotFoundException();
          case ApiStatusCodes.conflict:
            throw const ConflictException();
          case ApiStatusCodes.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
    }
  }
}
