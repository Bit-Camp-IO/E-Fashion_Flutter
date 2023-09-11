import 'package:efashion_flutter/core/api/api_consumer.dart';
import 'package:efashion_flutter/core/constants/api_constants.dart';
import 'package:efashion_flutter/core/error/exception.dart';
import 'package:injectable/injectable.dart';

abstract class TokensRemoteDataSource{
  Future<String> updateAccessToken({required String refreshToken});
}

@LazySingleton(as: TokensRemoteDataSource)
class TokensRemoteDataSourceImpl extends TokensRemoteDataSource{
  final ApiConsumer _apiConsumer;

  TokensRemoteDataSourceImpl(this._apiConsumer);
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
