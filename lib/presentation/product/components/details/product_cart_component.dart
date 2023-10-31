import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_color.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_pieces_counter.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_size.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartComponent extends StatefulWidget {
  const ProductCartComponent({
    super.key,
    required this.productName,
    required this.productColors,
    required this.productSizes,
    required this.productDescription,
    required this.productStock,
    required this.productPrice,
    required this.onAddToBagTap,
    required this.selectedColor,
    required this.selectedSize,
    required this.cartQuantity,
  });

  final String productName;
  final List productColors;
  final List productSizes;
  final String productDescription;
  final int productStock;
  final int productPrice;

  final void Function() onAddToBagTap;
  final void Function(String? color) selectedColor;
  final void Function(String? size) selectedSize;
  final void Function(int quantity) cartQuantity;

  @override
  State<ProductCartComponent> createState() => _ProductCartComponentState();
}

class _ProductCartComponentState extends State<ProductCartComponent> {
  final ValueNotifier<int> productPieces = ValueNotifier(1);
  ValueNotifier<int> selectedColorIndex = ValueNotifier(0);
  ValueNotifier<int> selectedSizeIndex = ValueNotifier(0);

  bool isBagButtonLoading = false;

  @override
  void initState() {
    widget.productColors.isNotEmpty
        ? widget.selectedColor(widget.productColors[0].hex)
        : widget.selectedColor(null);
    widget.productSizes.isNotEmpty
        ? widget.selectedSize(widget.productSizes[0])
        : widget.selectedSize(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productName,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          Text(
            '\$${widget.productPrice}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          SizedBox(height: 20.h),
          widget.productColors.isNotEmpty
              ? Row(
                  children: [
                    Text(
                      StringsManager.colorSection,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    SizedBox(
                      height: 40.h,
                      width: 240.w,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          widget.productColors.length,
                          (colorIndex) => ValueListenableBuilder(
                            valueListenable: selectedColorIndex,
                            builder: (context, value, child) => SelectableProductColor(
                              color: widget.productColors[colorIndex].hex,
                              onTap: () {
                                selectedColorIndex.value = colorIndex;
                                widget.selectedColor(
                                    widget.productColors[colorIndex].hex);
                              },
                              isSelected: colorIndex == value,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : const SizedBox.shrink(),
          SizedBox(height: 10.h),
          widget.productSizes.isNotEmpty
              ? Row(
                  children: [
                    Text(
                      StringsManager.sizeSection,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    SizedBox(width: 10.w),
                    SizedBox(
                      height: 40.h,
                      width: 240.w,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          widget.productSizes.length,
                          (sizeIndex) => ValueListenableBuilder(
                            valueListenable: selectedSizeIndex,
                            builder: (context, value, child) => SelectableProductSize(
                              size: widget.productSizes[sizeIndex],
                              onTap: () {
                                selectedSizeIndex.value = sizeIndex;
                                widget.selectedSize(
                                  widget.productSizes[sizeIndex],
                                );
                              },
                              isSelected: sizeIndex == value,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : const SizedBox.shrink(),
          Row(
            children: [
              Text(
                StringsManager.productStock(widget.productStock),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              ValueListenableBuilder(
                valueListenable: productPieces,
                builder: (context, value, child) => ProductPiecesCounter(
                  onIncrementPress: () {
                    if (productPieces.value != widget.productStock) {
                      productPieces.value++;
                    }
                  },
                  onDecrementPress: () {
                    if (productPieces.value != 0) {
                      productPieces.value--;
                    }
                  },
                  productPieces: value,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              widget.productDescription,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: BlocConsumer<CartCubit, CartState>(
              listenWhen: (previous, current) => previous.cartState != current.cartState,
              listener: (context, state) {
                if(state.cartState == CubitState.loading){
                  isBagButtonLoading = true;
                }else{
                  isBagButtonLoading = false;
                }
              },
              builder: (context, state) {
                return PrimaryButton(
                  onTap: widget.onAddToBagTap,
                  width: 312.w,
                  height: 46.h,
                  buttonTitle: StringsManager.addToBag,
                  isLoading: isBagButtonLoading,
                  buttonIcon: const Icon(Iconsax.bag_2, color: Colors.white),
                );
              },
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  @override
  void dispose() {
    selectedSizeIndex.dispose();
    selectedColorIndex.dispose();
    productPieces.dispose();
    super.dispose();
  }
}
