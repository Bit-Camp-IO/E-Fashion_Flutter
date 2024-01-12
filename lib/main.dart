import 'package:efashion_flutter/app.dart';
import 'package:efashion_flutter/bloc_observer.dart';
import 'package:efashion_flutter/hive_configration.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/shared/util/notifications_manager.dart';
import 'package:efashion_flutter/shared/util/payment_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await NotificationsManagerImpl().showNotification(message: message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    NotificationsManagerImpl().init(),
    HiveConfiguration.init(),
  ]);
  configureDependencies();
  await getIt<PaymentManager>().init();
  Bloc.observer = MyBlocObserver();
  runApp(const EfashionApp());
}
