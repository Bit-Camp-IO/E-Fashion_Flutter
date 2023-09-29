import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgetPasswordUseCase{
  final AuthRepository _authRepository;
  const ForgetPasswordUseCase(this._authRepository);

  Future<Either<Failure, String>> call({required String email}) async{
    return await _authRepository.forgetPassword(email: email);
  }
}