import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/create_payment_intent_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/edit_product_quantity_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_cart_products_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/remove_product_from_cart_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final AddProductToCartUseCase _addProductToCartUseCase;
  final RemoveProductFromCartUseCase _removeProductFromCartUseCase;
  final GetCartProductsUseCase _getCartProductsUseCase;
  final EditProductQuantityUseCase _editCartProductQuantityUseCase;
  final CreatePaymentIntentUseCase _createPaymentIntentUseCase;

  CartCubit(
    this._addProductToCartUseCase,
    this._removeProductFromCartUseCase,
    this._getCartProductsUseCase,
    this._editCartProductQuantityUseCase,
    this._createPaymentIntentUseCase,
  ) : super(const CartState());

  Future<void> getCartProducts() async {
    emit(state.copyWith(cartState: CubitState.loading));
    final response = await _getCartProductsUseCase();
    response.fold(
      (failure) => emit(
        state.copyWith(
          cartState: CubitState.failure,
          cartMessage: failure.message,
        ),
      ),
      (cartProducts) => emit(
        state.copyWith(
          cart: cartProducts,
          cartState: CubitState.success,
          paymentState: CubitState.initial,
        ),
      ),
    );
  }

  Future<void> addProductToCart({
    required String productId,
  }) async {
    debugPrint('========== ${state.selectedColor} ============ ');
    debugPrint('========== ${state.selectedSize} ============ ');
    emit(
      state.copyWith(
        cartState: CubitState.loading,
        paymentState: CubitState.initial,
      ),
    );
      final response = await _addProductToCartUseCase(
        productId: productId,
        productColor: state.selectedColor,
        productSize: state.selectedSize,
        productQuantity: state.selectedQuantity,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            cartState: CubitState.failure,
            cartMessage: failure.message,
          ),
        ),
        (cartProducts) => emit(
          state.copyWith(
              cart: cartProducts,
              cartState: CubitState.success,
          ),
        ),
      );
  }

  Future<void> removeProductFromCart({required String productId, required String productName}) async {
      final response = await _removeProductFromCartUseCase(
        productId: productId,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            cartState: CubitState.failure,
            cartMessage: failure.message,
            paymentState: CubitState.initial,
          ),
        ),
        (cart) {
          emit(
            state.copyWith(
              cart: cart,
              cartState: CubitState.success,
              paymentState: CubitState.initial,
            ),
          );
        },
      );
  }

  Future<void> createPaymentIntent({String? collectionId}) async {
    emit(state.copyWith(paymentState: CubitState.loading));
      final response = await _createPaymentIntentUseCase(
        paymentType: PaymentType.cart,
        collectionId: collectionId,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            paymentState: CubitState.failure,
            paymentMessage: failure.message,
          ),
        ),
        (clientSecret) {
          emit(
            state.copyWith(
              paymentClientSecret: clientSecret,
              paymentState: CubitState.success,
            ),
          );
        },
      );
  }

  Future<void> editProductQuantity({required productId, required int newQuantity}) async {
    emit(state.copyWith(paymentState: CubitState.initial));
      final response = await _editCartProductQuantityUseCase(
        productId: productId,
        newQuantity: newQuantity,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            cartState: CubitState.failure,
            cartMessage: failure.message,
          ),
        ),
        (cartProducts) => emit(
          state.copyWith(
            cart: cartProducts,
            cartState: CubitState.success,
          ),
        ),
      );
  }


  void updateSelectedColor(String? color) {
    emit(state.copyWith(selectedColor: () => color));
  }

  void updateSelectedSize(String? size) {
    emit(state.copyWith(selectedSize: () => size));
  }
  void updateSelectedQuantity(int quantity) {
    emit(state.copyWith(selectedQuantity: quantity));
  }

}
