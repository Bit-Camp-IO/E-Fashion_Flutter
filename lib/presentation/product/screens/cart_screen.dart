import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/empty_widget.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/product/components/cart/dismissible_cart_card.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
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
                    return Column(
                      children: [
                        SizedBox(height: 16.h),
                        BlocBuilder<CartCubit, CartState>(
                          buildWhen: (previous, current) =>
                              previous.cart.products != current.cart.products,
                          builder: (context, state) {
                            final CartCubit cartCubit =
                                context.read<CartCubit>();
                            return Expanded(
                              child: ListView.builder(
                                itemCount: state.cart.products.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final String productName = state.cart.products[index].title;
                                  final String productId = state.cart.products[index].id;
                                  final int totalPrice = state.cart.products[index].totalPrice;
                                  final String productImage = state.cart.products[index].imageUrl;
                                  int productQuantity = state.cart.products[index].quantity;
                                  final int productStock =  state.cart.products[index].stock;
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0).r,
                                    child: DismissibleCartCard(
                                      key: ValueKey<String>(productId),
                                      productName: productName,
                                      productId: productId,
                                      totalPrice: totalPrice,
                                      productImage: productImage,
                                      quantity: productQuantity,
                                      stock: productStock,
                                      onPiecesIncrement: () async {
                                        if(productQuantity <= state.cart.products[index].stock){
                                          productQuantity++;
                                          await cartCubit.editProductQuantity(
                                            productId: productId,
                                            newQuantity: productQuantity,
                                          );
                                        }

                                      },
                                      onPiecesDecrement: () async {
                                        if(productQuantity > 1){
                                          productQuantity--;
                                          await cartCubit.editProductQuantity(
                                            productId: productId,
                                            newQuantity: productQuantity--,
                                          );
                                        }
                                      },
                                      onDismissed: (dismissDirection) async {
                                        await cartCubit.removeProductFromCart(
                                          productId: productId,
                                          productName: productName,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 150.h,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                BlocBuilder<CartCubit, CartState>(
                                  buildWhen: (previous, current) =>
                                      previous.cart.subTotal !=
                                      current.cart.subTotal,
                                  builder: (context, state) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          StringsManager.cartSubTotal,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurfaceVariant,
                                              ),
                                        ),
                                        AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          child: Text(
                                            key: ValueKey<int>(
                                                state.cart.subTotal),
                                            '\$${state.cart.subTotal}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(height: 8.h),
                                PrimaryButton(
                                  buttonTitle: StringsManager.cartCheckOutButtonTitle,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
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
