import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserAccessTokenUseCase {
  final AuthRepository _authRepository;
  GetUserAccessTokenUseCase(this._authRepository);
  Future<Either<Failure,String>>  call() async{
    return await _authRepository.getAccessToken();
  }
}