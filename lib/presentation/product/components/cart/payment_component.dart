import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/snack_bar.dart';
import 'package:efashion_flutter/shared/theme/theme_manager.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentComponent extends StatefulWidget {
  const PaymentComponent({super.key});

  @override
  State<PaymentComponent> createState() => _PaymentComponentState();
}

class _PaymentComponentState extends State<PaymentComponent> {
  bool isCheckOutLoading = false;

  Future<void> initPaymentSheet({required clientSecretKey}) async {
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
        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          customSnackBarType: CustomSnackBarType.success,
          message: 'Order Payment Success!',
          context: context,
        ));
        context.read<CartCubit>().getCartProducts();
      });
    } on StripeException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            customSnackBarType: CustomSnackBarType.error,
            message: e.error.message!,
            context: context,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) =>
              previous.cart.subTotal != current.cart.subTotal,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringsManager.cartSubTotal,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme
                            .onSurfaceVariant,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration:
                      const Duration(milliseconds: 200),
                      child: Text(
                        key: ValueKey<int>(state.cart.subTotal),
                        '\$${state.cart.subTotal}',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 8.h),
            BlocConsumer<CartCubit, CartState>(
              listenWhen: (previous, current) =>
              previous.paymentState != current.paymentState,
              listener: (context, state) async {
                if (state.paymentState == CubitState.loading) {
                  isCheckOutLoading = true;
                } else if (state.paymentState == CubitState.success) {
                  isCheckOutLoading = false;
                  await initPaymentSheet(
                    clientSecretKey: state.paymentClientSecret,
                  );
                } else {
                  isCheckOutLoading = false;
                }
              },
              buildWhen: (previous, current) =>
              previous.paymentState != current.paymentState,
              builder: (context, state) => PrimaryButton(
                buttonTitle: StringsManager.cartCheckOutButtonTitle,
                isLoading: isCheckOutLoading,
                onTap: () {
                  context.read<CartCubit>().createPaymentIntent(
                    paymentType: PaymentType.cart,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
