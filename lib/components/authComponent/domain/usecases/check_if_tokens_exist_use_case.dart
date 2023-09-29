import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckIfTokensExistUseCase{
  final AuthRepository _authRepository;
  CheckIfTokensExistUseCase(this._authRepository);
  Either<Failure, Tokens> call(){
    return _authRepository.checkIfTokensExist();
  }
}