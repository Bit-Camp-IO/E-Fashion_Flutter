import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart';
import 'package:efashion_flutter/components/authComponent/domain/entities/tokens.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserLoginUseCase{
  final AuthRepository authRepository;
  const UserLoginUseCase({required this.authRepository});

  Future<Either<Failure, Tokens>> call({required String email, required String password}) async{
    return await authRepository.userLogin(email: email, password: password);
  }
}