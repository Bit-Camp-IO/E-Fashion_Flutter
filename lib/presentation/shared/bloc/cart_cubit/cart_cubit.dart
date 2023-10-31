import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/add_product_to_cart_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/create_payment_intent_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/edit_product_quantity_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_cart_products_usecase.dart';
import 'package:efashion_flutter/components/cartComponent/domain/usecases/remove_product_from_cart_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final AddProductToCartUseCase _addProductToCartUseCase;
  final RemoveProductFromCartUseCase _removeProductFromCartUseCase;
  final GetCartProductsUseCase _getCartProductsUseCase;
  final EditProductQuantityUseCase _editCartProductQuantityUseCase;
  final GetUserAccessTokenUseCase _getAccessTokenUseCase;
  final CreatePaymentIntentUseCase _createPaymentIntentUseCase;

  late String userAccessToken;

  CartCubit(
    this._addProductToCartUseCase,
    this._removeProductFromCartUseCase,
    this._getCartProductsUseCase,
    this._editCartProductQuantityUseCase,
    this._getAccessTokenUseCase,
    this._createPaymentIntentUseCase,
  ) : super(const CartState());

  Future<void> getCartProducts() async {
    emit(state.copyWith(cartState: CubitState.loading));
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    final response = await _getCartProductsUseCase(
      userAccessToken: userAccessToken,
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
          paymentState: CubitState.initial,
        ),
      ),
    );
  }

  Future<void> addProductToCart({
    required String productId,
    required String productName,
  }) async {
    emit(
      state.copyWith(
        cartState: CubitState.loading,
        paymentState: CubitState.initial,
      ),
    );
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response = await _addProductToCartUseCase(
        userAccessToken: userAccessToken,
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
              cartMessage:
                  '${productName.length > 12 ? productName.substring(0, 12) : productName} Added To Cart Successfully.'),
        ),
      );
    }
  }

  Future<void> removeProductFromCart(
      {required String productId, required String productName}) async {
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response = await _removeProductFromCartUseCase(
        userAccessToken: userAccessToken,
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
  }

  Future<void> createPaymentIntent({String? collectionId}) async {
    emit(state.copyWith(paymentState: CubitState.loading));
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response = await _createPaymentIntentUseCase(
        paymentType: PaymentType.cart,
        collectionId: collectionId,
        userAccessToken: userAccessToken,
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
  }

  Future<void> editProductQuantity(
      {required productId, required int newQuantity}) async {
    emit(state.copyWith(
        cartState: CubitState.loading, paymentState: CubitState.initial));
    final getUserAccessToken = await _getAccessTokenUseCase();
    userAccessToken = getUserAccessToken.getOrElse(() => '');
    if (userAccessToken.isNotEmpty) {
      final response = await _editCartProductQuantityUseCase(
        userAccessToken: userAccessToken,
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
  }

  void updateSelectedQuantity(int quantity) {
    emit(state.copyWith(selectedQuantity: quantity));
    debugPrint(state.selectedQuantity.toString());
  }

  void updateSelectedColor(String? color) {
    emit(state.copyWith(
        selectedColor: color != null ? color.toString() : color));
    debugPrint(state.selectedColor);
  }

  void updateSelectedSize(String? size) {
    emit(state.copyWith(selectedSize: size));
    debugPrint(state.selectedSize);
  }
}
