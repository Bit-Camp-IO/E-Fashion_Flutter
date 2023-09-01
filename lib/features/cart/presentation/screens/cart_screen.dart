import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/widgets/custom_appbar.dart';
import 'package:efashion_flutter/core/widgets/primary_button.dart';
import 'package:efashion_flutter/core/widgets/product_pieces_counter.dart';
import 'package:efashion_flutter/features/cart/presentation/mock/cart_mock.dart';
import 'package:flutter/material.dart';
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
              appBarTitle: 'Shopping Bag',
              appBarType: AppBarType.normal,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: cartList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0).r,
                    child: Dismissible(
                      key: ValueKey<int>(cartList[index].productId),
                      child: Container(
                        width: 312.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(20).r,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8,
                          ).r,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15).r,
                                child: CachedNetworkImage(
                                  width: 90.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                  imageUrl: cartList[index].productImage,
                                ),
                              ),
                              SizedBox(
                                width: 24.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cartList[index].productName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                  ),
                                  cartList[index].selectedSize != null
                                      ? Text(
                                          'Size : ${cartList[index].selectedSize!}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                              ),
                                        )
                                      : const SizedBox.shrink(),
                                  SizedBox(
                                      height:
                                          cartList[index].selectedSize != null
                                              ? 8.h
                                              : 4.h),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${cartList[index].productPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
                                            ),
                                      ),
                                      ProductPiecesCounter(
                                        onIncrementPress: () {},
                                        onDecrementPress: () {},
                                        productPieces: 0,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 150.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub total :',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                      Text(
                        '\$600.00',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  PrimaryButton(
                    buttonTitle: 'Checkout',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
