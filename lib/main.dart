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

import 'shared/constants/app_constants.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.instance.subscribeToTopic(AppConstants.generalNotificationsTopic);
  await NotificationsManager.showNotification(message: message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Future.wait([
    NotificationsManager.init(),
    HiveConfigration.init(),
    StripeConfigration.init(),
  ]);
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const EfashionApp());
}
