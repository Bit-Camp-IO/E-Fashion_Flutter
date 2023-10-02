import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_color.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_pieces_counter.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_size.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
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
    required this.productStock,
    required this.productPrice,
    required this.addToBag,
  });

  final String productName;
  final List productColors;
  final List productSizes;
  final String productDescription;
  final int productStock;
  final int productPrice;
  final void Function() addToBag;

  @override
  State<ProductCartComponent> createState() => _ProductCartComponentState();
}

class _ProductCartComponentState extends State<ProductCartComponent> {
  final ValueNotifier<int> _productPieces = ValueNotifier(0);
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
                          (colorIndex) => ProductColor(
                            color: widget.productColors[colorIndex].hex,
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
                StringsManager.productStock(widget.productStock),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              ValueListenableBuilder(
                valueListenable: _productPieces,
                builder: (context, value, child) => ProductPiecesCounter(
                  onIncrementPress: () {
                    if (_productPieces.value != widget.productStock) {
                      _productPieces.value++;
                    }
                  },
                  onDecrementPress: () {
                    if (_productPieces.value != 0) {
                      _productPieces.value--;
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
            child: PrimaryButton(
              onTap: widget.addToBag,
              width: 312.w,
              height: 46.h,
              buttonTitle: StringsManager.addToBag,
              buttonIcon: const Icon(Iconsax.bag_2, color: Colors.white),
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
  @override
  void dispose() {
    _productPieces.dispose();
    super.dispose();
  }
}
