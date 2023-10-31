import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/cart/components/cart_list_component.dart';
import 'package:efashion_flutter/presentation/cart/components/cart_shimmer_loading.dart';
import 'package:efashion_flutter/presentation/cart/components/payment_component.dart';
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/empty_widget.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_internet_connection_widget.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = false;

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
              child: BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  if(state.cartState == CubitState.loading){
                    isLoading = true;
                  }else{
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  if (state.cartState == CubitState.initial || state.cartState == CubitState.loading) {
                    return const CartShimmerLoading();
                  } else if (state.cart.products.isEmpty &&
                      state.cartState == CubitState.success) {
                    return const EmptyWidget(
                      image: AssetsManager.cartImage,
                      title: StringsManager.emptyCartTitle,
                      subTitle: StringsManager.emptyCartSubTitle,
                    );
                  } else if (state.cartState == CubitState.success) {
                    return const Column(
                      children: [CartListComponent(), PaymentComponent()],
                    );
                  } else {
                    return NoInternetConnectionWidget(
                      onButtonTap: () {
                        context.read<CartCubit>().getCartProducts();
                      },
                      isButtonLoading: isLoading,
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
