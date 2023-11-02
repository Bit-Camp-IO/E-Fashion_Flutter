import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/presentation/shared/widgets/product_pieces_counter.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class DismissibleCartCard extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productId;
  final int totalPrice;
  final String? selectedSize;
  final String? selectedColor;
  final int stock;
  final int quantity;
  final void Function() onPiecesIncrement;
  final void Function() onPiecesDecrement;
  final void Function(DismissDirection dismissDirection) onDismissed;
  const DismissibleCartCard({
    super.key,
    required this.productName,
    required this.productId,
    required this.totalPrice,
    required this.productImage,
    required this.stock,
    this.selectedSize,
    this.selectedColor,
    required this.quantity,
    required this.onPiecesIncrement,
    required this.onPiecesDecrement,
    required this.onDismissed,
  });


  @override
  State<DismissibleCartCard> createState() => _DismissibleCartCardState();
}

class _DismissibleCartCardState extends State<DismissibleCartCard> {
  int _cleanHexCode(String hexCode){
    String cleanedHex = hexCode.replaceAll("#", "");
    return int.parse('0xFF$cleanedHex');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20).r,
      child: Dismissible(
        key: widget.key!,
        direction: DismissDirection.endToStart,
        onDismissed: widget.onDismissed,
        background: Container(
          color: Theme.of(context).colorScheme.error,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Iconsax.trash, color: Colors.white,),
              SizedBox(width: 30.w),
            ],
          ),
        ),
        child: Container(
          width: 312.w,
          height: 140.h,
          color: Theme.of(context).colorScheme.surfaceVariant,
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
                    height: 120.h,
                    fit: BoxFit.cover,
                    imageUrl: widget.productImage,
                    cacheManager: CacheManager(
                      Config(
                        AppConstants.cacheFolder,
                        stalePeriod:
                        const Duration(days: AppConstants.cacheDuration),
                      ),
                    ),
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
                      widget.productName.length > 15
                          ? widget.productName.substring(0, 15)
                          : widget.productName,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    SizedBox(
                      height: widget.selectedSize == null && widget.selectedColor == null ? 0 : 10.h,
                    ),
                    widget.selectedColor != null ?
                        Row(
                          children: [
                            Text(StringsManager.colorSection,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                             ),
                            ),
                            SizedBox(width: 4.w),
                            CircleAvatar(
                              radius: 7.r,
                              backgroundColor: Color(_cleanHexCode(widget.selectedColor!)),
                            ),
                          ],
                        )
                        : const SizedBox.shrink(),
                    SizedBox(height: widget.selectedSize == null && widget.selectedColor == null ?  0 : 4.h),
                    widget.selectedSize != null
                        ? Text(
                            '${StringsManager.sizeSection}${widget.selectedSize!}',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          )
                        : const SizedBox.shrink(),
                    Row(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          child: Text(
                            key: ValueKey<int>(widget.totalPrice),
                            '${StringsManager.currencySign}${widget.totalPrice}',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ),
                        ProductPiecesCounter(
                          onIncrementPress: widget.onPiecesIncrement,
                          onDecrementPress: widget.onPiecesDecrement,
                          productPieces: widget.quantity,
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
  }
}
