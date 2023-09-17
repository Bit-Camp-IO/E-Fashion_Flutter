import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAccessTokenUseCase {
  final AuthRepository _authRepository;
  GetAccessTokenUseCase(this._authRepository);
  Future<Either<Failure,String>>  call() async{
    return await _authRepository.getAccessToken();
  }
}