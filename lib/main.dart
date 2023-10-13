import 'package:efashion_flutter/app.dart';
import 'package:efashion_flutter/bloc_observer.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/components/userComponent/data/models/app_theme_model.dart';
import 'package:efashion_flutter/components/authComponent/data/models/tokens_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Hive.initFlutter(),
    dotenv.load(fileName: "lib/.env"),
  ]);
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  Hive.registerAdapter(AppThemeModelAdapter());
  Hive.registerAdapter(TokensModelAdapter());
  await Future.wait([
  Stripe.instance.applySettings(),
  Hive.openBox<AppThemeModel>(AppConstants.themeBox),
  Hive.openBox<TokensModel>(AppConstants.authBox),
  ]);
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const EfashionApp());
}
