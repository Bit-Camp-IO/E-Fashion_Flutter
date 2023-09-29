import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VerifyOtpUseCase {
  final AuthRepository _authRepository;

  const VerifyOtpUseCase(this._authRepository);

  Future<Either<Failure, void>> call({required String email, required String otpCode}) async {
    return await _authRepository.verifyOtp(email: email, otpCode: otpCode);
  }
}
