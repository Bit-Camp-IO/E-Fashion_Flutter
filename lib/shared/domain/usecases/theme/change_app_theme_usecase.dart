import 'package:efashion_flutter/shared/domain/entities/app_theme.dart';
import 'package:efashion_flutter/shared/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangeAppThemeUseCase{
  final ThemeRepository themeRepository;

  const ChangeAppThemeUseCase({required this.themeRepository});

  Future<AppTheme> call({required bool isDarkTheme}) async{
    return await themeRepository.changeAppTheme(isDarkTheme);
  }
}