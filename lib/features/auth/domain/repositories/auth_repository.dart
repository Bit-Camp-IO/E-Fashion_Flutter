import 'package:efashion_flutter/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/shared/domain/entities/tokens.dart';

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
}
