import 'package:efashion_flutter/presentation/cart/components/dismissible_cart_card.dart';
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartListComponent extends StatelessWidget {
  const CartListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
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
              final int productStock = state.cart.products[index].stock;
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
                    if (productQuantity <=
                        state.cart.products[index].stock) {
                      productQuantity++;
                      await cartCubit.editProductQuantity(
                        productId: productId,
                        newQuantity: productQuantity,
                      );
                    }
                  },
                  onPiecesDecrement: () async {
                    if (productQuantity > 1) {
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
    );
  }
}
