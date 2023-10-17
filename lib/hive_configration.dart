import 'package:efashion_flutter/components/authComponent/data/models/tokens_model.dart';
import 'package:efashion_flutter/components/userComponent/data/models/app_theme_model.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfigration{
   static Future<void> init() async{
     await Hive.initFlutter();
     Hive.registerAdapter(AppThemeModelAdapter());
     Hive.registerAdapter(TokensModelAdapter());
     await Future.wait([
       Hive.openBox<AppThemeModel>(AppConstants.themeBox),
       Hive.openBox<TokensModel>(AppConstants.authBox),
     ]);
  }
}