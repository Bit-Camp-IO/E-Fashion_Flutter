import 'package:efashion_flutter/shared/domain/entities/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'app_theme_model.g.dart';
@HiveType(typeId: 1)
class AppThemeModel extends HiveObject{

  @HiveField(0)
  final bool isDarkTheme;

  AppThemeModel({required this.isDarkTheme});

  AppTheme toAppTheme() {
    return AppTheme(isDarkTheme: isDarkTheme);
  }
}