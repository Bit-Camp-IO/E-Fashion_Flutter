import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/widgets/custom_appbar.dart';
import 'package:efashion_flutter/features/account/presentation/components/order_status/order_status_card.dart';
import 'package:efashion_flutter/features/account/presentation/mock/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OrdersStatusScreen extends StatelessWidget {
  const OrdersStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 24, right: 24).r,
        child: Column(
          children: [
            const CustomAppBar(
              appBarTitle: 'Orders Status',
              appBarType: AppBarType.normal,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: ordersList.length,
                itemBuilder: (context, index) {
                  return OrderStatusCard(
                    orderPicture: ordersList[index].orderPicture,
                    orderName: ordersList[index].orderName,
                    orderSize: ordersList[index].orderSize,
                    orderCost: ordersList[index].orderCost,
                    orderProgress: ordersList[index].orderProgress,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
