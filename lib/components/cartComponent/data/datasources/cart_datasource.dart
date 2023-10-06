import 'package:efashion_flutter/components/cartComponent/data/models/cart_product_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:injectable/injectable.dart';

abstract class CartDataSource {
  Future<String> addProductToCart({
    required String userAccessToken,
    required String productId,
    required String productSize,
    required String productColor,
    required int productQuantity,
  });

  Future<String> removeProductFromCart({
    required String userAccessToken,
    required String productId,
  });

  Future<void> editProductQuantity({
    required String userAccessToken,
    required String productId,
    required String newQuantity,
  });

  Future<List<CartProductModel>> getCartProducts({
    required String userAccessToken,
  });
}

@LazySingleton(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource {
  final ApiConsumer _apiConsumer;

  CartDataSourceImpl(@Named(ApiConstants.mainConsumerName) this._apiConsumer);

  @override
  Future<String> addProductToCart({
    required String userAccessToken,
    required String productId,
    required String productSize,
    required String productColor,
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
      return 'Added Successfully To Your Cart.';
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<void> editProductQuantity({
    required String userAccessToken,
    required String productId,
    required String newQuantity,
  }) async{
    final response =
        await _apiConsumer.patch(ApiConstants.cartEndPoint, headers: {
      'Authorization': 'Bearer $userAccessToken',
    }, body: {
      'id': productId,
      'quantity': newQuantity,
    });
    if(response['status'] == ApiCallStatus.error.value){
      throw const FetchDataException();
    }
  }

  @override
  Future<List<CartProductModel>> getCartProducts({required String userAccessToken}) async{
    final response = await _apiConsumer.get(ApiConstants.cartEndPoint, headers: {
      'Authorization': 'Bearer $userAccessToken',
    });
    if (response['status'] == ApiCallStatus.success.value) {
      return List<CartProductModel>.from((response['data']['items'] as List).map((product) => CartProductModel.fromJson(product)));
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<String> removeProductFromCart({required String userAccessToken, required String productId}) async{
    final response =
        await _apiConsumer.delete(ApiConstants.cartEndPoint, headers: {
      'Authorization': 'Bearer $userAccessToken',
    }, body: {
      'id': productId,
    });
    if (response['status'] == ApiCallStatus.success.value) {
      return 'Removed Successfully From Your Cart.';
    } else {
      throw const FetchDataException();
    }
  }
}
