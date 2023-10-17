import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeConfigration{
  static Future<void> init() async{
   await dotenv.load(fileName: "lib/.env");
   Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
   await Stripe.instance.applySettings();
  }
}