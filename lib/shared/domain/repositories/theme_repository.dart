import 'package:efashion_flutter/shared/domain/entities/app_theme.dart';

abstract class ThemeRepository {
  AppTheme getAppTheme();
  Future<AppTheme> changeAppTheme(bool isDarkMode);
}