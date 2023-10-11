import 'package:efashion_flutter/components/cartComponent/data/models/cart_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:injectable/injectable.dart';

abstract class CartDataSource {
  Future<CartModel> addProductToCart({
    required String userAccessToken,
    required String productId,
    required String? productSize,
    required String? productColor,
    required int productQuantity,
  });

  Future<CartModel> removeProductFromCart({
    required String userAccessToken,
    required String productId,
  });

  Future<CartModel> editProductQuantity({
    required String userAccessToken,
    required String productId,
    required int newQuantity,
  });

  Future<CartModel> getCartProducts({
    required String userAccessToken,
  });
}

@LazySingleton(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource {
  final ApiConsumer _apiConsumer;

  CartDataSourceImpl(@Named(ApiConstants.mainConsumerName) this._apiConsumer);

  @override
  Future<CartModel> addProductToCart({
    required String userAccessToken,
    required String productId,
    required String? productSize,
    required String? productColor,
    required int productQuantity,
  }) async {
    final response =
        await _apiConsumer.post(ApiConstants.cartEndPoint, headers: {
      'Authorization': 'Bearer $userAccessToken',
    }, body: {
      'id': productId,
      'size': productSize,
      'color': productColor,
      'quantity': productQuantity,
    });
    if (response['status'] == ApiCallStatus.success.value) {
      return CartModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<CartModel> editProductQuantity({
    required String userAccessToken,
    required String productId,
    required int newQuantity,
  }) async {
    final response =
        await _apiConsumer.patch(ApiConstants.cartEndPoint, headers: {
      'Authorization': 'Bearer $userAccessToken',
    }, body: {
      'id': productId,
      'quantity': newQuantity,
    });
    if (response['status'] == ApiCallStatus.success.value) {
      return CartModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<CartModel> getCartProducts(
      {required String userAccessToken}) async {
    final response =
        await _apiConsumer.get(ApiConstants.cartEndPoint, headers: {
      'Authorization': 'Bearer $userAccessToken',
    });
    if (response['status'] == ApiCallStatus.success.value) {
      return CartModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<CartModel> removeProductFromCart(
      {required String userAccessToken, required String productId}) async {
    final response =
        await _apiConsumer.delete(ApiConstants.cartEndPoint, headers: {
      'Authorization': 'Bearer $userAccessToken',
    }, body: {
      'id': productId,
    });
    if (response['status'] == ApiCallStatus.success.value) {
      // return CartModel.fromJson(response['data']);
      return await getCartProducts(userAccessToken: userAccessToken);
    } else {
      throw const FetchDataException();
    }
  }
}
