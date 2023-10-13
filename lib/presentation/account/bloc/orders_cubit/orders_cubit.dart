import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart_order.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_orders_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetUserAccessTokenUseCase _getAccessTokenUseCase;
  final GetOrdersListUseCase _getOrdersListUseCase;
  late String userAccessToken;

  OrdersCubit(
    this._getAccessTokenUseCase,
    this._getOrdersListUseCase,
  ) : super(OrdersInitial());

  Future<void> getOrdersList() async {
    emit(OrdersLoadingState());
    final getAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response =
          await _getOrdersListUseCase(userAccessToken: userAccessToken);
      response.fold(
        (failure) => emit(
          OrdersFailureState(message: failure.message),
        ),
        (ordersList) => emit(
          OrderSuccessState(orders: ordersList),
        ),
      );
    } else {
      emit(const OrdersFailureState(message: 'There Was an Error!'));
    }
  }
}
