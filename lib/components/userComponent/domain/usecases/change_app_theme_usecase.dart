import 'package:efashion_flutter/components/userComponent/domain/entities/app_theme.dart';
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangeAppThemeUseCase{
  final UserRepository themeRepository;

  const ChangeAppThemeUseCase({required this.themeRepository});

  Future<AppTheme> call({required bool isDarkTheme}) async{
    return await themeRepository.changeAppTheme(isDarkTheme);
  }
}