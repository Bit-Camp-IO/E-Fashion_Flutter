import 'dart:async';
import 'package:efashion_flutter/shared/theme/theme_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeManager{

  static final StripeManager _stripeManager = StripeManager._internal();

  factory StripeManager() {
    return _stripeManager;
  }

  StripeManager._internal();
  static Future<void> init() async{
    await dotenv.load(fileName: "lib/.env");
    Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
    await Stripe.instance.applySettings();
  }

  static Future<void> initPaymentSheet({required clientSecretKey, required BuildContext context, required void Function() onSuccess, required void Function(String error) onFailure,}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          customFlow: false,
          merchantDisplayName: 'eFashion Store',
          paymentIntentClientSecret: clientSecretKey,
          appearance: ThemeManager.stripeSheetTheme(context: context),
        ),
      );
      await Stripe.instance.presentPaymentSheet().then((value) {
        onSuccess();
      },);
    } on StripeException catch (e) {
      onFailure(e.error.message!);
    }
  }
}

