import 'dart:async';
import 'package:efashion_flutter/core/theme/theme_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';

abstract class PaymentManager {
  Future<void> init();

  Future<void> initPaymentSheet({
    required clientSecretKey,
    required BuildContext context,
    required void Function() onSuccess,
    required void Function(String error) onFailure,
  });
}

@LazySingleton(as: PaymentManager)
class StripePaymentManager extends PaymentManager{

  @override
  Future<void> init() async {
    await dotenv.load(fileName: "lib/.env");
    Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
    await Stripe.instance.applySettings();
  }

  @override
  Future<void> initPaymentSheet({
    required clientSecretKey,
    required BuildContext context,
    required void Function() onSuccess,
    required void Function(String error) onFailure,
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          customFlow: false,
          merchantDisplayName: 'eFashion Store',
          paymentIntentClientSecret: clientSecretKey,
          appearance: ThemeManager.stripeSheetTheme(context: context),
        ),
      );
      await Stripe.instance.presentPaymentSheet().then(
        (value) {
          onSuccess();
        },
      );
    } on StripeException catch (e) {
      onFailure(e.error.message!);
    }
  }
}
