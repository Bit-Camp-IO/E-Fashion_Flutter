import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_color.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_sheet_shimmer_loading.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_color.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_pieces_counter.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_size.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CartBottomSheet extends StatefulWidget {
  const CartBottomSheet({
    super.key,
    required this.productName,
    required this.productId,
    required this.productPrice,
    required this.productColors,
    required this.productSizes,
    required this.productStock,
  });

  final String productName;

  final String productId;
  final int productPrice;
  final int productStock;
  final List<ProductColor> productColors;
  final List<String> productSizes;

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  ValueNotifier<int> selectedColorIndex = ValueNotifier(0);
  ValueNotifier<int> selectedSizeIndex = ValueNotifier(0);
  ValueNotifier<int> productPieces = ValueNotifier(1);
  bool isBagButtonLoading = false;
  late final CartCubit cartCubit;

  @override
  void initState() {
    super.initState();
    cartCubit = context.read<CartCubit>();
  }

  double _cartHeight() {
    if (widget.productColors.isNotEmpty && widget.productSizes.isNotEmpty) {
      return 450.h;
    } else if (widget.productColors.isNotEmpty ||
        widget.productSizes.isNotEmpty) {
      return 390.h;
    } else {
      return 340.h;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productName.isNotEmpty) {
      widget.productColors.isNotEmpty
          ? cartCubit.updateSelectedColor(widget.productColors[0].hex)
          : null;
      widget.productSizes.isNotEmpty
          ? cartCubit.updateSelectedSize(widget.productSizes[0])
          : null;
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: CustomFadeAnimation(
          duration: const Duration(milliseconds: 250),
          child: Container(
            height: _cartHeight(),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ).r,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0).r,
              child: Column(
                children: [
                  Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24).r,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.productName.length > 20
                                  ? '${widget.productName.substring(0, 20)}..'
                                  : widget.productName,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(width: 40.w),
                            Text(
                              '\$${widget.productPrice}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        widget.productColors.isNotEmpty
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 45.h,
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Colors : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16).r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                              widget.productColors.length,
                                              (colorsIndex) {
                                                String color = widget
                                                    .productColors[colorsIndex]
                                                    .hex;
                                                return ValueListenableBuilder(
                                                  valueListenable:
                                                      selectedColorIndex,
                                                  builder:
                                                      (context, value, child) =>
                                                          SelectableProductColor(
                                                    color: color,
                                                    onTap: () {
                                                      selectedColorIndex.value =
                                                          colorsIndex;
                                                      cartCubit
                                                          .updateSelectedColor(
                                                        color,
                                                      );
                                                    },
                                                    isSelected:
                                                        colorsIndex == value,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        widget.productColors.isNotEmpty
                            ? SizedBox(height: 24.h)
                            : const SizedBox.shrink(),
                        widget.productSizes.isNotEmpty
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 45.h,
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Sizes : ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 24).r,
                                          child: Row(
                                            children: List.generate(
                                              widget.productSizes.length,
                                              (sizeIndex) {
                                                String size = widget
                                                    .productSizes[sizeIndex];
                                                return ValueListenableBuilder(
                                                  valueListenable:
                                                      selectedSizeIndex,
                                                  builder:
                                                      (context, value, child) =>
                                                          SelectableProductSize(
                                                    size: size,
                                                    onTap: () {
                                                      selectedSizeIndex.value =
                                                          sizeIndex;
                                                      context
                                                          .read<CartCubit>()
                                                          .updateSelectedSize(
                                                              size);
                                                    },
                                                    isSelected:
                                                        sizeIndex == value,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        widget.productSizes.isNotEmpty
                            ? SizedBox(height: 24.h)
                            : const SizedBox.shrink(),
                        Row(
                          mainAxisAlignment: widget.productColors.isEmpty &&
                                  widget.productSizes.isEmpty
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.productStock} Pieces Available',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(width: 40.w),
                            ValueListenableBuilder(
                              valueListenable: productPieces,
                              builder: (context, value, child) =>
                                  ProductPiecesCounter(
                                onIncrementPress: () {
                                  if (value != widget.productStock) {
                                    productPieces.value++;
                                    cartCubit.updateSelectedQuantity(
                                      productPieces.value,
                                    );
                                  }
                                },
                                onDecrementPress: () {
                                  if (value != 1) {
                                    productPieces.value--;
                                    cartCubit.updateSelectedQuantity(
                                      productPieces.value,
                                    );
                                  }
                                },
                                productPieces: value,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        BlocConsumer<CartCubit, CartState>(
                          listenWhen: (previous, current) =>
                              previous.cartState != current.cartState,
                          listener: (context, state) {
                            if (state.cartState == CubitState.loading) {
                              isBagButtonLoading = true;
                            } else if (state.cartState == CubitState.success) {
                              context.popRoute();
                            } else {
                              isBagButtonLoading = false;
                            }
                          },
                          builder: (context, state) {
                            return PrimaryButton(
                              width: 230.w,
                              onTap: () => cartCubit.addProductToCart(
                                  productId: widget.productId,
                                  productName: widget.productName),
                              isLoading: isBagButtonLoading,
                              buttonTitle: 'Add To Bag',
                              buttonIcon:
                                  const Icon(Iconsax.bag_2, color: Colors.white),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 450.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ).r,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0).r,
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(10).r),
              ),
            ),
            const Expanded(
              child: CartSheetShimmerLoading(),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    selectedSizeIndex.dispose();
    selectedColorIndex.dispose();
    productPieces.dispose();
    super.dispose();
  }
}
