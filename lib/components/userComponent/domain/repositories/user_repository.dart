import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/app_theme.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/shared/error/failure.dart';

abstract class UserRepository {
  AppTheme getAppTheme();

  Future<AppTheme> changeAppTheme(bool isDarkMode);

  Future<Either<Failure, User>> getUserData();

  Future<Either<Failure, String>> updateUserPicture({
    required String imagePath,
    required String imageName,
  });

  Future<Either<Failure, User>> updateUserData({
    required String fullName,
    required String? phoneNumber,
    required String email,
  });
}
