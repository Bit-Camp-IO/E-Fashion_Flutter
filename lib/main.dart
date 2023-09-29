import 'package:efashion_flutter/app.dart';
import 'package:efashion_flutter/bloc_observer.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/components/userComponent/data/models/app_theme_model.dart';
import 'package:efashion_flutter/components/authComponent/data/models/tokens_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AppThemeModelAdapter());
  Hive.registerAdapter(TokensModelAdapter());
  await Hive.openBox<AppThemeModel>(AppConstants.themeBox);
  await Hive.openBox<TokensModel>(AppConstants.authBox);
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const EfashionApp());
}
