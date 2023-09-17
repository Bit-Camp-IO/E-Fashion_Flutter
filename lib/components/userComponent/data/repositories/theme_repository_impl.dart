import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart';
import 'package:efashion_flutter/components/userComponent/domain/entities/app_theme.dart';
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository{
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});
  @override
  AppTheme getAppTheme() {
    final appThemeModel = userLocalDataSource.getAppTheme();
    return appThemeModel.toAppTheme();
  }

  @override
  Future<AppTheme> changeAppTheme(bool isDarkMode) async{
    final appThemeModel = await userLocalDataSource.changeAppTheme(isDarkMode);
    return appThemeModel.toAppTheme();
  }
}