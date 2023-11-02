import 'package:efashion_flutter/components/cartComponent/domain/entities/cart_order.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_orders_list_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersListUseCase _getOrdersListUseCase;

  OrdersCubit(
    this._getOrdersListUseCase,
  ) : super(const OrdersState());

  Future<void> getOrdersList() async {
    emit(state.copyWith(ordersState: CubitState.loading));
    final response =
    await _getOrdersListUseCase();
    response.fold(
          (failure) => emit(
            state.copyWith(
              ordersState: CubitState.failure,
              failMessage: failure.message,
            ),
          ),
          (ordersList) => emit(
            state.copyWith(orders: ordersList, ordersState: CubitState.success),
          ),
    );
  }
}
