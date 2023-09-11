import 'package:efashion_flutter/shared/data/datasources/theme_local_data_source.dart';
import 'package:efashion_flutter/shared/domain/entities/app_theme.dart';
import 'package:efashion_flutter/shared/domain/repositories/theme_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository{
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({required this.localDataSource});
  @override
  AppTheme getAppTheme() {
    final appThemeModel = localDataSource.getAppTheme();
    return appThemeModel.toAppTheme();
  }

  @override
  Future<AppTheme> changeAppTheme(bool isDarkMode) async{
    final appThemeModel = await localDataSource.changeAppTheme(isDarkMode);
    return appThemeModel.toAppTheme();
  }
}