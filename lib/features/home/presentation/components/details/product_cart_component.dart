import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/core/widgets/primary_button_with_icon.dart';
import 'package:efashion_flutter/core/widgets/product_color.dart';
import 'package:efashion_flutter/core/widgets/product_pieces_counter.dart';
import 'package:efashion_flutter/core/widgets/product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartComponent extends StatefulWidget {
  const ProductCartComponent({
    super.key,
    required this.productName,
    required this.productColors,
    required this.productSizes,
    required this.productDescription,
    required this.productPieces,
    required this.productPrice,
  });

  final String productName;
  final List productColors;
  final List productSizes;
  final String productDescription;
  final int productPieces;
  final int productPrice;

  @override
  State<ProductCartComponent> createState() => _ProductCartComponentState();
}

class _ProductCartComponentState extends State<ProductCartComponent> {
  int _productPieces = 0;
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.productName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorsManager.textColorPrimary,
                ),
          ),
          Text(
            '\$${widget.productPrice}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorsManager.textColorPrimary,
                ),
          ),
           SizedBox(height: 20.h),
          widget.productColors.isNotEmpty
              ? Row(
                  children: [
                    Text(
                      'Colors : ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorsManager.textColorPrimary,
                          ),
                    ),
                    SizedBox(
                      height: 40.h,
                      width: 240.w,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          widget.productColors.length,
                          (colorIndex) => ProductColor(
                            color: widget.productColors[colorIndex],
                            onTap: () {
                              setState(() {
                                _selectedColorIndex = colorIndex;
                              });
                            },
                            isSelected: colorIndex == _selectedColorIndex,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : const SizedBox.shrink(),
          SizedBox(height: 10.h),
          widget.productColors.isNotEmpty
              ? Row(
                  children: [
                    Text(
                      'Sizes : ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: ColorsManager.textColorPrimary,
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
                          (sizeIndex) => ProductSize(
                            size: widget.productSizes[sizeIndex],
                            onTap: () {
                              setState(() {
                                _selectedSizeIndex = sizeIndex;
                              });
                            },
                            isSelected: sizeIndex == _selectedSizeIndex,
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
                '${widget.productPieces} Pieces available : ',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorsManager.textColorPrimary,
                    ),
              ),
              ProductPiecesCounter(
                onIncrementPress: () {
                  if (_productPieces != widget.productPieces) {
                    setState(() {
                      _productPieces++;
                    });
                  }
                },
                onDecrementPress: () {
                  if (_productPieces != 0) {
                    setState(() {
                      _productPieces--;
                    });
                  }
                },
                productPieces: _productPieces,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              widget.productDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorsManager.textColorSecondary),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: PrimaryButtonWithIcon(
              onTap: () {},
              width: 312.w,
              height: 46.h,
              buttonTitle: 'Add To Bag',
              buttonIcon: const Icon(Iconsax.bag_2, color: Colors.white),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
