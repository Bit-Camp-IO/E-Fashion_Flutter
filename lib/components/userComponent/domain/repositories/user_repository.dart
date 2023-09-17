import 'package:efashion_flutter/components/userComponent/domain/entities/app_theme.dart';

abstract class UserRepository {
  AppTheme getAppTheme();
  Future<AppTheme> changeAppTheme(bool isDarkMode);
}