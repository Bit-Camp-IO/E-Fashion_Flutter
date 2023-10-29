import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/account/bloc/orders_cubit/orders_cubit.dart';
import 'package:efashion_flutter/presentation/account/components/order_status/shimmer_loading_order_status_card.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/account/components/order_status/order_status_card.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget implements AutoRouteWrapper {
  const OrdersScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..getOrdersList(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 24, right: 24).r,
        child: Column(
          children: [
            const CustomAppBar(
              appBarTitle: 'Orders List',
              appBarType: AppBarType.normal,
            ),
            Expanded(
              child: BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.orders.isEmpty ? 5 : state.orders.length,
                    itemBuilder: (context, index) {
                      if (state.ordersState == CubitState.initial || state.ordersState == CubitState.loading) {
                        return const ShimmerLoadingOrderStatusCard();
                      } else {
                        return CustomFadeAnimation(
                          duration: const Duration(milliseconds: 500),
                          child: OrderStatusCard(
                            orderId: state.orders[index].id,
                            orderCost: state.orders[index].totalPrice,
                            orderStatus: state.orders[index].status,
                          ),
                        );
                      }
                    },
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
