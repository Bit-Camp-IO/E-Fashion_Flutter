import 'package:efashion_flutter/app.dart';
import 'package:efashion_flutter/bloc_observer.dart';
import 'package:efashion_flutter/firebase_options.dart';
import 'package:efashion_flutter/hive_configration.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/shared/util/notifications_manager.dart';
import 'package:efashion_flutter/stripe_configration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationsManager.showNotification(message);
  debugPrint("Background Message: ${message.messageId}");
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    HiveConfigration.init(),
    StripeConfigration.init(),
  ]);
  await NotificationsManager().init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const EfashionApp());
}