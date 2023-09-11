import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/exception.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/features/auth/data/datasources/auth_data_source.dart';
import 'package:efashion_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/shared/data/datasources/tokens_local_data_source.dart';
import 'package:efashion_flutter/shared/domain/entities/tokens.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;
  final TokensLocalDataSource _tokensLocalDataSource;
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
}
