import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserDataUseCase{
  final UserRepository _userRepository;
  const GetUserDataUseCase(this._userRepository);

  Future<Either<Failure, User>> call({required String userAccessToken}) async{
    return await _userRepository.getUserData(userAccessToken: userAccessToken);
  }
}