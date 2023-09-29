import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/components/userComponent/data/models/app_theme_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class UserLocalDataSource{
  AppThemeModel getAppTheme();
  Future<AppThemeModel> changeAppTheme(bool isDarkMode);
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl extends UserLocalDataSource{
  final Box<AppThemeModel> themeDatabase = Hive.box(AppConstants.themeBox);

  @override
  AppThemeModel getAppTheme() {
    if (themeDatabase.containsKey(AppConstants.themeBox)) {
      final AppThemeModel theme = themeDatabase.get(AppConstants.themeBox)!;
      return theme;
    } else {
      themeDatabase.put((AppConstants.themeBox), AppThemeModel(isDarkTheme: false));
      final AppThemeModel theme = themeDatabase.get(AppConstants.themeBox)!;
      return theme;
    }
  }

  @override
  Future<AppThemeModel> changeAppTheme(bool isDarkMode) async{
    await themeDatabase.put(AppConstants.themeBox, AppThemeModel(isDarkTheme: isDarkMode));
    return AppThemeModel(isDarkTheme: themeDatabase.get(AppConstants.themeBox)!.isDarkTheme);
  }
}