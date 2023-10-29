part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  final List<CartOrder> orders;
  final CubitState ordersState;
  final String failMessage;

  const OrdersState({
    this.orders = const [],
    this.ordersState = CubitState.initial,
    this.failMessage = '',
  });

  @override
  List<Object> get props => [
        orders,
        ordersState,
        failMessage,
      ];

  OrdersState copyWith({
    List<CartOrder>? orders,
    CubitState? ordersState,
    String? failMessage,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      ordersState: ordersState ?? this.ordersState,
      failMessage: failMessage ?? this.failMessage,
    );
  }
}
