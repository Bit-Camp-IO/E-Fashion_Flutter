import 'package:efashion_flutter/components/userComponent/domain/entities/app_theme.dart';
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAppThemeUseCase{
  final UserRepository themeRepository;
  const GetAppThemeUseCase({required this.themeRepository});

  AppTheme call(){
    return themeRepository.getAppTheme();
  }
}