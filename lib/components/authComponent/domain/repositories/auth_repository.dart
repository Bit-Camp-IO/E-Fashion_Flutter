import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';

abstract class AuthRepository {
  Future<Either<Failure, Tokens>> userLogin({
    required String email,
    required String password,
  });

  Future<Either<Failure, Tokens>> userSignUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Either<Failure, Tokens> checkIfTokensExist();
  Future<void> deleteTokens();
  Future<Either<Failure, String>> getAccessToken();
  Future<Either<Failure, String>> forgetPassword({required String email});
  Future<Either<Failure, void>> verifyOtp({required String email, required String otpCode});
  Future<Either<Failure, String>> resetPassword({required String email, required String otpCode, required newPassword});
}
