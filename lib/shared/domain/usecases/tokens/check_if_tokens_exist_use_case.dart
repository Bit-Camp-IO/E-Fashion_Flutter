import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/shared/domain/entities/tokens.dart';
import 'package:efashion_flutter/shared/domain/repositories/tokens_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckIfTokensExistUseCase{
  final TokensRepository _tokensRepository;
  CheckIfTokensExistUseCase(this._tokensRepository);
  Either<Failure, Tokens> call(){
    return _tokensRepository.checkIfTokensExist();
  }
}