import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductPiecesCounter extends StatelessWidget {
  final void Function() onIncrementPress;
  final void Function() onDecrementPress;
  final int productPieces;

  const ProductPiecesCounter({
    super.key,
    required this.onIncrementPress,
    required this.onDecrementPress,
    required this.productPieces,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onDecrementPress,
          icon: const Icon(Iconsax.minus_cirlce, size: 24),
          color: Theme.of(context).colorScheme.onSurface,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Text(
            key: ValueKey<int>(productPieces),
            '$productPieces',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        IconButton(
          onPressed: onIncrementPress,
          icon: const Icon(Iconsax.add_circle, size: 24),
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ],
    );
  }
}
