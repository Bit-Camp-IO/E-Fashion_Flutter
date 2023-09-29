import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetPasswordUseCase{
  final AuthRepository _authRepository;

  const ResetPasswordUseCase(this._authRepository);

  Future<Either<Failure, String>> call({required String email, required String newPassword, required String otpCode}) async{
    return await _authRepository.resetPassword(email: email, otpCode: otpCode, newPassword: newPassword);
  }
}