import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangePasswordUseCase {
  final AuthRepository _authRepository;

  const ChangePasswordUseCase(this._authRepository);

  Future<Either<Failure, String>> call({
    required String userAccessToken,
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    return await _authRepository.changePassword(
      userAccessToken: userAccessToken,
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmNewPassword: confirmNewPassword,
    );
  }
}
