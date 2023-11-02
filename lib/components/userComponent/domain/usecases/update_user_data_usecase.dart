import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserDataUseCase {
  final UserRepository _userRepository;

  const UpdateUserDataUseCase(this._userRepository);

  Future<Either<Failure, User>> call({
    required String fullName,
    required String? phoneNumber,
    required String email,
  }) async {
    return await _userRepository.updateUserData(
      fullName: fullName,
      phoneNumber: phoneNumber,
      email: email,
    );
  }
}
