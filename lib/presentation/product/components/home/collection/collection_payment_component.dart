import 'dart:ui';

import 'package:efashion_flutter/presentation/product/bloc/collections_cubit/collections_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/secondary_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_snack_bar.dart';
import 'package:efashion_flutter/shared/theme/theme_manager.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CollectionPaymentComponent extends StatefulWidget {
  const CollectionPaymentComponent({super.key, required this.collectionPrice, required this.collectionId});

  final int collectionPrice;
  final String collectionId;
  @override
  State<CollectionPaymentComponent> createState() => _CollectionPaymentComponentState();
}

class _CollectionPaymentComponentState extends State<CollectionPaymentComponent> {
  bool isBuyButtonLoading = false;

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
        ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.show(
          customSnackBarType: CustomSnackBarType.success,
          message: 'Order Payment Success!',
          context: context,
        ));
      });
    } on StripeException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBar.show(
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
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.elliptical(100, 50),
        topRight: Radius.elliptical(100, 50),
      ).r,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: Container(
          width: 360.w,
          height: 192.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.3),
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.collectionPrice}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
                SizedBox(width: 16.w),
                BlocConsumer<CollectionsCubit, CollectionsState>(
                  listenWhen: (previous, current) =>
                      previous.paymentState != current.paymentState,
                  listener: (context, state) async {
                    if (state.paymentState == CubitState.loading) {
                      isBuyButtonLoading = true;
                    } else if (state.paymentState == CubitState.success) {
                      isBuyButtonLoading = false;
                      await initPaymentSheet(
                        clientSecretKey: state.paymentClientSecret,
                      );
                    } else {
                      isBuyButtonLoading = false;
                    }
                  },
                  builder: (context, state) {
                    return SecondaryButton(
                      width: 150.w,
                      height: 42.h,
                      buttonTitle: 'Buy Collection',
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      isLoading: isBuyButtonLoading,
                      onTap: () {
                        context.read<CollectionsCubit>().createPaymentIntent(collectionId: widget.collectionId);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
