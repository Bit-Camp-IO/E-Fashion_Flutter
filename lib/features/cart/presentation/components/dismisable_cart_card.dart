import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/widgets/product_pieces_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class DismissibleCartCard extends StatefulWidget {
  const DismissibleCartCard({
    super.key,
    required this.productName,
    required this.productId,
    required this.productPrice,
    required this.productImage,
    required this.cartPieces,
    required this.cartPrice,
    this.selectedSize,
    required this.availablePieces,
    required this.onPiecesIncrement,
    required this.onPiecesDecrement,
    required this.orderedPieces,
    required this.onDismissed,
  });

  final String productName;
  final String productImage;
  final int productId;
  final int productPrice;
  final String? selectedSize;
  final int cartPieces;
  final int cartPrice;
  final int availablePieces;
  final void Function() onPiecesIncrement;
  final void Function() onPiecesDecrement;
  final void Function(int pieces) orderedPieces;
  final void Function(int dismissedItemPrice) onDismissed;

  @override
  State<DismissibleCartCard> createState() => _DismissibleCartCardState();
}

class _DismissibleCartCardState extends State<DismissibleCartCard> {
  late int cartPieces;
  late int cartPrice;

  @override
  void initState() {
    cartPieces = widget.cartPieces;
    cartPrice = widget.cartPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20).r,
      child: Dismissible(
        key: ValueKey<int>(widget.productId),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {

          setState(() {
            widget.onDismissed(cartPrice);
          });
        },
        background: Container(
          color: Theme.of(context).colorScheme.error,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Iconsax.trash),
              SizedBox(width: 30.w),
            ],
          ),
        ),
        child: Container(
          width: 312.w,
          height: 120.h,
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
                    height: 100.h,
                    fit: BoxFit.cover,
                    imageUrl: widget.productImage,
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
                      widget.productName,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    widget.selectedSize != null
                        ? Text(
                            'Size : ${widget.selectedSize!}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          )
                        : const SizedBox.shrink(),
                    SizedBox(height: widget.selectedSize != null ? 8.h : 4.h),
                    Row(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            key: ValueKey<int>(cartPrice),
                            '\$$cartPrice',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ),
                        ProductPiecesCounter(
                          onIncrementPress: () {
                            setState(() {
                              if (cartPieces != widget.availablePieces) {
                                cartPieces++;
                                cartPrice = widget.productPrice * cartPieces;
                                widget.onPiecesIncrement();
                                widget.orderedPieces(cartPieces);
                              }

                            });
                          },
                          onDecrementPress: () {
                            setState(() {
                              if (cartPieces != 1) {
                                cartPieces--;
                                cartPrice = widget.productPrice * cartPieces;
                                widget.onPiecesDecrement();
                                widget.orderedPieces(cartPieces);
                              }
                            });
                          },
                          productPieces: cartPieces,
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
