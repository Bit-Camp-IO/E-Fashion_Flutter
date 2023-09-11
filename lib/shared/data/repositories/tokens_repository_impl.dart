import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/exception.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/shared/data/datasources/tokens_local_data_source.dart';
import 'package:efashion_flutter/shared/data/datasources/tokens_remote_data_source.dart';
import 'package:efashion_flutter/shared/domain/entities/tokens.dart';
import 'package:efashion_flutter/shared/domain/repositories/tokens_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TokensRepository)
class TokensRepositoryImpl extends TokensRepository{

  final TokensLocalDataSource _tokensLocalDataSource;
  final TokensRemoteDataSource _tokensRemoteDataSource;
  const TokensRepositoryImpl(this._tokensLocalDataSource, this._tokensRemoteDataSource);


  @override
  Future<void> deleteTokens() {
    return _tokensLocalDataSource.deleteAuthTokens();
  }

  @override
  Either<Failure, Tokens> checkIfTokensExist() {
    try{
      final tokens  = _tokensLocalDataSource.checkIfTokensExist();
      return right(tokens.toAuthTokens());
    } on TokensException catch(exception){
      return left(CacheFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure,String>> getAccessToken() async{
    try{
      final accessToken = _tokensLocalDataSource.getAccessToken();
      if(accessToken.isNotEmpty){
        return right('>>>>> From Local : $accessToken');
      }else{
        final refreshToken = await _tokensLocalDataSource.getRefreshToken();
        final newAccessToken = await _tokensRemoteDataSource.updateAccessToken(refreshToken: refreshToken);
        _tokensLocalDataSource.updateAccessToken(accessToken: newAccessToken);
        return right('>>>>> From Data Source : $newAccessToken');
      }
    }on TokensException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}