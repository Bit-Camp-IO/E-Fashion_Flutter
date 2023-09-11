import 'package:efashion_flutter/core/constants/app_constants.dart';
import 'package:efashion_flutter/core/error/exception.dart';
import 'package:efashion_flutter/shared/data/models/tokens/tokens_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class TokensLocalDataSource{
  Future<void> addAuthTokens({required TokensModel authTokensModel});
  TokensModel checkIfTokensExist();
  String getAccessToken();
  Future<String> getRefreshToken();
  Future<void> updateAccessToken({required String accessToken});
  Future<void> deleteAuthTokens();
}

@LazySingleton(as: TokensLocalDataSource)
class TokensLocalDataSourceImpl extends TokensLocalDataSource{
  final Box<TokensModel> authDatabase = Hive.box(AppConstants.authBox);

  @override
  Future<void> addAuthTokens({required TokensModel authTokensModel}) async{
    await authDatabase.put(AppConstants.authBox, authTokensModel);
  }

  @override
  TokensModel checkIfTokensExist() {
    if(authDatabase.containsKey(AppConstants.authBox)){
      return authDatabase.get(AppConstants.authBox)!;
    }else{
      throw const TokensException('No Tokens Found');
    }
  }

  @override
  String getAccessToken() {
     final accessTokenExpireTime = authDatabase.get(AppConstants.authBox)!.accessTokenTimeStamp.add(const Duration(minutes: 15));
     final currentTime = DateTime.now();
      if(currentTime.isBefore(accessTokenExpireTime)){
        return authDatabase.get(AppConstants.authBox)!.accessToken;
      } else{
        return '';
    }
  }

  @override
  Future<String> getRefreshToken() async{
    final refRefreshExpireTime = authDatabase.get(AppConstants.authBox)!.refreshTokenTimeStamp.add(const Duration(days: 30));
    final currentTime = DateTime.now();
    if(currentTime.isBefore(refRefreshExpireTime)){
      return authDatabase.get(AppConstants.authBox)!.refreshToken;
    } else{
      await authDatabase.delete(AppConstants.authBox);
      throw const TokensException('Refresh Token Expired');
    }
  }

  @override
  Future<void> deleteAuthTokens() async{
    if(authDatabase.containsKey(AppConstants.authBox)){
      await authDatabase.delete(AppConstants.authBox);
    }
  }

  @override
  Future<void> updateAccessToken({required String accessToken}) async{
    if(authDatabase.containsKey(AppConstants.authBox)){
      TokensModel oldData =  authDatabase.get(AppConstants.authBox)!;
      await authDatabase.put(AppConstants.authBox, oldData.copyWith(accessToken: accessToken, accessTokenTimeStamp: DateTime.now()));
    }
  }
}