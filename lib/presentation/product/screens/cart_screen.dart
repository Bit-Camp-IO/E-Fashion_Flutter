import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/components/cart/cart_list_component.dart';
import 'package:efashion_flutter/presentation/product/components/cart/payment_component.dart';
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/empty_widget.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24).r,
        child: Column(
          children: [
            const CustomAppBar(
              appBarTitle: StringsManager.cartScreenTitle,
              appBarType: AppBarType.normal,
              disableBackButton: true,
            ),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state.cart.products.isEmpty) {
                    return const EmptyWidget(
                      image: AssetsManager.cartImage,
                      title: StringsManager.emptyCartTitle,
                      subTitle: StringsManager.emptyCartSubTitle,
                    );
                  } else {
                    return const Column(
                      children: [
                        CartListComponent(),
                        PaymentComponent()
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
