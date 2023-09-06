import 'package:efashion_flutter/app.dart';
import 'package:efashion_flutter/bloc_observer.dart';
import 'package:efashion_flutter/core/constants/app_constants.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/shared/data/models/app_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AppThemeModelAdapter());
  await Hive.openBox<AppThemeModel>(AppConstants.themeBox);
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const EfashionApp());
}
