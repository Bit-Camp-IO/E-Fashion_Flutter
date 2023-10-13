part of 'orders_cubit.dart';

abstract class OrdersState extends Equatable {
  @override
  List<Object> get props => [];
  const OrdersState();
}

class OrdersInitial extends OrdersState {}

class OrdersLoadingState extends OrdersState{}

class OrdersFailureState extends OrdersState{
  final String message;
  const OrdersFailureState({required this.message});
  @override
  List<Object> get props => [message];
}

class OrderSuccessState extends OrdersState{
  final List<CartOrder> orders;
  const OrderSuccessState({required this.orders});
  @override
  List<Object> get props => [orders];
}