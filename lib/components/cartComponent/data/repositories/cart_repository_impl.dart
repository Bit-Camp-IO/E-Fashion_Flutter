import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/data/datasources/cart_datasource.dart';
import 'package:efashion_flutter/components/cartComponent/data/models/cart_model.dart';
import 'package:efashion_flutter/components/cartComponent/data/models/cart_order_model.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CartRepository)
class CartRepositoryImpl extends CartRepository{
  final CartDataSource _cartDataSource;

  CartRepositoryImpl(this._cartDataSource);
  @override
  Future<Either<Failure, CartModel>> addProductToCart({required String userAccessToken, required String productId, required String? productSize, required String? productColor, required int productQuantity}) async{
    try{
    final CartModel response = await _cartDataSource.addProductToCart(userAccessToken: userAccessToken, productId: productId, productSize: productSize, productColor: productColor, productQuantity: productQuantity);
    return right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, CartModel>> editProductQuantity({required String userAccessToken, required String productId, required int newQuantity}) async{
    try{
    final CartModel response = await _cartDataSource.editProductQuantity(userAccessToken: userAccessToken, productId: productId, newQuantity: newQuantity);
    return right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCartProducts({required String userAccessToken}) async{
    try{
    final CartModel cartProducts = await _cartDataSource.getCartProducts(userAccessToken: userAccessToken);
    return right(cartProducts);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, CartModel>> removeProductFromCart({required String userAccessToken, required String productId}) async{
    try{
    final CartModel response = await _cartDataSource.removeProductFromCart(userAccessToken: userAccessToken, productId: productId);
    return Right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> createPaymentIntent({required String userAccessToken, required PaymentType paymentType, String? collectionId}) async{
    try{
      final String response = await _cartDataSource.createPaymentIntent(userAccessToken: userAccessToken, paymentType: paymentType, collectionId: collectionId);
      return Right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<CartOrderModel>>> getOrdersList({required String userAccessToken}) async{
    try{
      final List<CartOrderModel> ordersList = await _cartDataSource.getOrdersList(userAccessToken: userAccessToken);
      return right(ordersList);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}