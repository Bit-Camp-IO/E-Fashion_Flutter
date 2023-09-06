import 'package:efashion_flutter/shared/presentation/widgets/primary_button.dart';
import 'package:efashion_flutter/shared/presentation/widgets/product_color.dart';
import 'package:efashion_flutter/shared/presentation/widgets/product_pieces_counter.dart';
import 'package:efashion_flutter/shared/presentation/widgets/product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CartBottomSheet extends StatefulWidget {
  const CartBottomSheet({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productColors,
    required this.productSizes,
    required this.productPieces,
  });

  final String productName;
  final int productPrice;
  final int productPieces;
  final List productColors;
  final List productSizes;

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  int productPieces = 0;

  @override
  Widget build(BuildContext context) {
      return Container(
        height: widget.productColors.isNotEmpty ? 430.h : 320.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ).r,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24).r,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.productName,
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
              widget.productColors.isNotEmpty ? Row(
                children: [
                  Text(
                    'Colors : ',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.productColors.length,
                        (colorsIndex) {
                          String color = widget.productColors[colorsIndex];
                          return ProductColor(
                            color: color,
                            onTap: () {
                              setState(() {
                                selectedColorIndex = colorsIndex;
                              });
                            },
                            isSelected: colorsIndex == selectedColorIndex,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ) : const SizedBox.shrink(),
              widget.productColors.isNotEmpty ? SizedBox(height: 24.h) : const SizedBox.shrink(),
              widget.productSizes.isNotEmpty ? Row(
                children: [
                  Text(
                    'Sizes : ',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.productSizes.length,
                        (sizeIndex) {
                          String size = widget.productSizes[sizeIndex];
                          return ProductSize(
                            size: size,
                            onTap: () {
                              setState(() {
                                selectedSizeIndex = sizeIndex;
                              });
                            },
                            isSelected: selectedSizeIndex == sizeIndex,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ) : const SizedBox.shrink(),
              widget.productSizes.isNotEmpty ? SizedBox(height: 24.h) : const SizedBox.shrink(),
              Row(
                children: [
                  Text(
                    '${widget.productPieces} Pieces Available',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(width: 40.w),
                  ProductPiecesCounter(
                    onIncrementPress: () {
                      setState(() {
                        if (productPieces != widget.productPieces) {
                          productPieces++;
                        }
                      });
                    },
                    onDecrementPress: () {
                      setState(() {
                        if (productPieces != 0) {
                          productPieces--;
                        }
                      });
                    },
                    productPieces: productPieces,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              PrimaryButton(
                width: 230.w,
                onTap: () {},
                buttonTitle: 'Add To Bag',
                buttonIcon: const Icon(Iconsax.bag_2, color: Colors.white),
              ),
            ],
          ),
        ),
      );
    }
}
