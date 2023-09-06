import 'package:efashion_flutter/core/constants/app_constants.dart';
import 'package:efashion_flutter/shared/data/models/app_theme_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource{
  AppThemeModel getAppTheme();
  Future<AppThemeModel> changeAppTheme(bool isDarkMode);
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource{

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