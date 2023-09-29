import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/app_theme.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/user.dart';
import 'package:efashion_flutter/shared/error/failure.dart';

abstract class UserRepository {
  AppTheme getAppTheme();
  Future<AppTheme> changeAppTheme(bool isDarkMode);
  Future<Either<Failure, User>> getUserData({required String userAccessToken});
}