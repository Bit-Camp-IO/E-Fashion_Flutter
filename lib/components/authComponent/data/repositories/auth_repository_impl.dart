import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/data/datasources/local/auth_local_data_source.dart';
import 'package:efashion_flutter/core/error/exception.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/components/authComponent/data/datasources/remote/auth_data_source.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;
  final AuthLocalDataSource _tokensLocalDataSource;
  AuthRepositoryImpl(this._authDataSource, this._tokensLocalDataSource);

  @override
  Future<Either<Failure, Tokens>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authDataSource.userLogin(
        email: email,
        password: password,
      );
      _tokensLocalDataSource.addAuthTokens(authTokensModel: result);
      return right(result.toAuthTokens());
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Tokens>> userSignUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final result = await _authDataSource.userSignUp(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      _tokensLocalDataSource.addAuthTokens(authTokensModel: result);
      return right(result.toAuthTokens());
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

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
        return right(accessToken);
      }else{
        final refreshToken = await _tokensLocalDataSource.getRefreshToken();
        final newAccessToken = await _authDataSource.updateAccessToken(refreshToken: refreshToken);
        _tokensLocalDataSource.updateAccessToken(accessToken: newAccessToken);
        return right(newAccessToken);
      }
    }on TokensException catch(exception){
      return left(Failure(exception.message!));
    }
  }

}
