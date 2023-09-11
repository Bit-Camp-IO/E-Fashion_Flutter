import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/shared/domain/entities/tokens.dart';

abstract class TokensRepository{
  const TokensRepository();
  Either<Failure, Tokens> checkIfTokensExist();
  Future<void> deleteTokens();
  Future<Either<Failure,String>> getAccessToken();
}