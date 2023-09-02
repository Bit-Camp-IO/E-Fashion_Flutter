import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/widgets/custom_appbar.dart';
import 'package:efashion_flutter/core/widgets/primary_button.dart';
import 'package:efashion_flutter/features/cart/presentation/mock/cart_mock.dart';
import 'package:efashion_flutter/features/cart/presentation/components/dismisable_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
   int _totalPrice = 0;

  _calculateTotalPrice(){
    for(int cartIndex = 0; cartIndex < cartList.length; cartIndex++ ){
        _totalPrice += cartList[cartIndex].cartPrice;
    }
  }

  @override
  void initState() {
    _calculateTotalPrice();
    super.initState();
  }
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
              disableBackButton: true,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: cartList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0).r,
                    child: DismissibleCartCard(
                      productName: cartList[index].productName,
                      productId: cartList[index].productId,
                      productPrice: cartList[index].productPrice,
                      productImage: cartList[index].productImage,
                      cartPieces: cartList[index].cartPieces,
                      cartPrice: cartList[index].cartPrice,
                      availablePieces: cartList[index].avaliblePieces,
                      onPiecesIncrement: () {
                        setState(() {
                          _totalPrice += cartList[index].productPrice;
                          debugPrint('executed');
                        });
                      },
                      onPiecesDecrement: () {

                        setState(() {

                          _totalPrice -= cartList[index].productPrice;
                        });
                      },
                      orderedPieces: (pieces) {

                      },
                      onDismissed: (dismissedItemPrice) {
                        setState(() {
                          cartList.removeWhere((element) => element.productId == cartList[index].productId);
                          _totalPrice -= dismissedItemPrice;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 150.h,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
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
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            key: ValueKey<int>(_totalPrice),
                            '\$$_totalPrice',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
