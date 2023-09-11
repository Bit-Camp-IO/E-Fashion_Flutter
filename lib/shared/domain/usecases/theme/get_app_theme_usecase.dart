import 'package:efashion_flutter/shared/domain/entities/app_theme.dart';
import 'package:efashion_flutter/shared/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAppThemeUseCase{
  final ThemeRepository themeRepository;
  const GetAppThemeUseCase({required this.themeRepository});

  AppTheme call(){
    return themeRepository.getAppTheme();
  }
}