import 'package:efashion_flutter/components/cartComponent/data/models/cart_model.dart';
import 'package:efashion_flutter/components/cartComponent/data/models/cart_order_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:injectable/injectable.dart';

abstract class CartDataSource {
  Future<CartModel> addProductToCart({
    required String productId,
    required String? productSize,
    required String? productColor,
    required int productQuantity,
  });

  Future<CartModel> removeProductFromCart({
    required String productId,
  });

  Future<CartModel> editProductQuantity({
    required String productId,
    required int newQuantity,
  });

  Future<CartModel> getCartProducts();

  Future<String> createPaymentIntent({
    required PaymentType paymentType,
    String? collectionId,
  });

  Future<List<CartOrderModel>> getOrdersList();
}

@LazySingleton(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource {
  final ApiConsumer _apiConsumer;

  CartDataSourceImpl(@Named(ApiConstants.authenticatedConsumer) this._apiConsumer);

  @override
  Future<CartModel> addProductToCart({
    required String productId,
    required String? productSize,
    required String? productColor,
    required int productQuantity,
  }) async {
    final requestBody = {
      'id': productId,
      'quantity': productQuantity,
    };
    if (productSize != null) {
      requestBody['size'] = productSize;
    }
    if (productColor != null) {
      requestBody['color'] = productColor;
    }
    final response =
        await _apiConsumer.post(ApiConstants.cartEndPoint,body: requestBody);
    if (response['status'] == ApiCallStatus.success.value) {
      return CartModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<CartModel> editProductQuantity({
    required String productId,
    required int newQuantity,
  }) async {
    final response =
        await _apiConsumer.patch(ApiConstants.cartEndPoint, body: {
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
  Future<CartModel> getCartProducts() async {
    final response =
        await _apiConsumer.get(ApiConstants.cartEndPoint);
    if (response['status'] == ApiCallStatus.success.value) {
      return CartModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<CartModel> removeProductFromCart({required String productId}) async {
    final response =
        await _apiConsumer.delete(ApiConstants.cartEndPoint, body: {
      'id': productId,
    });
    if (response['status'] == ApiCallStatus.success.value) {
      return await getCartProducts();
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<String> createPaymentIntent({
    required PaymentType paymentType,
    String? collectionId,
  }) async {
    final response = await _apiConsumer.post(ApiConstants.paymentIntentEndPoint,
        body: paymentType == PaymentType.collection ? {'collectionId': collectionId} : {},
        queryParameters: {
          'type': paymentType == PaymentType.collection ? 'collection' : 'cart'
        });
    if (response['status'] == ApiCallStatus.success.value) {
      return response['data']['clientSecret'];
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<List<CartOrderModel>> getOrdersList() async {
    final response =
        await _apiConsumer.get(ApiConstants.ordersEndPoint);
    if (response['status'] == ApiCallStatus.success.value) {
      return List<CartOrderModel>.from(
        (response['data'] as List).map(
          (order) => CartOrderModel.fromJson(order),
        ),
      );
    } else {
      throw const FetchDataException();
    }
  }
}
