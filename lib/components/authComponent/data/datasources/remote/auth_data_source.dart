import 'package:efashion_flutter/core/api/api_consumer.dart';
import 'package:efashion_flutter/core/constants/api_constants.dart';
import 'package:efashion_flutter/core/error/exception.dart';
import 'package:efashion_flutter/components/authComponent/data/models/tokens_model.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<TokensModel> userLogin({
    required String email,
    required String password,
  });

  Future<TokensModel> userSignUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<String> updateAccessToken({required String refreshToken});
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource {
  final ApiConsumer _apiConsumer;

  AuthDataSourceImpl(this._apiConsumer);

  @override
  Future<TokensModel> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await _apiConsumer.post(
      ApiConstants.authLoginEndPoint,
      body: {
        "email": email,
        "password": password,
      },
    );
    if(response['status'] == 'success'){
      return TokensModel.fromJson(response);
    }else{
      throw const ServerException('Check Your Email And Password');
    }
  }

  @override
  Future<TokensModel> userSignUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await _apiConsumer.post(
      ApiConstants.authSignUpEndPoint,
      body: {
        "fullName": fullName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
      },
    );
    if(response['status'] == 'success'){
      return TokensModel.fromJson(response);
    }else{
      throw const ServerException('Error: check your internet connection.');
    }
  }
  @override
  Future<String> updateAccessToken({required String refreshToken}) async{
    final newAccessToken = await _apiConsumer.get(ApiConstants.refreshAccessToken, headers: {
      'X-Refresh-Token' : refreshToken,
    });
    if(newAccessToken['status'] == 'success'){
      return newAccessToken['data']['accessToken'];
    }else{
      throw TokensException(newAccessToken['error']['message']);
    }
  }
}
