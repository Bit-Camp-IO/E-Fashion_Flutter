import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProfilePictureUseCase{
  final UserRepository _userRepository;

  const UpdateProfilePictureUseCase(this._userRepository);
  Future<Either<Failure, String>> call({required String imagePath, required String imageName}) async{
    return await _userRepository.updateUserPicture(imagePath: imagePath, imageName: imageName);
  }
}