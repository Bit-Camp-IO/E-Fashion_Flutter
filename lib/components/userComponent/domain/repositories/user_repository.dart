import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/app_theme.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/shared/error/failure.dart';

abstract class UserRepository {
  AppTheme getAppTheme();

  Future<AppTheme> changeAppTheme(bool isDarkMode);

  Future<Either<Failure, User>> getUserData({required String userAccessToken});

  Future<Either<Failure, String>> updateUserPicture({
    required String userAccessToken,
    required String imagePath,
    required String imageName,
  });

  Future<Either<Failure, User>> updateUserData({
    required String userAccessToken,
    required String fullName,
    required String? phoneNumber,
    required String email,
  });
}
