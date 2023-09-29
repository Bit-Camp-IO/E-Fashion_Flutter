import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserSignUpUseCase {
  final AuthRepository authRepository;

  UserSignUpUseCase({required this.authRepository});

  Future<Either<Failure, Tokens>> call({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return await authRepository.userSignUp(
      fullName: fullName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
