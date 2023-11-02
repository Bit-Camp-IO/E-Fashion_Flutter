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
  Future<Either<Failure, CartModel>> addProductToCart({required String productId, required String? productSize, required String? productColor, required int productQuantity}) async{
    try{
    final CartModel response = await _cartDataSource.addProductToCart(productId: productId, productSize: productSize, productColor: productColor, productQuantity: productQuantity);
    return right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, CartModel>> editProductQuantity({required String productId, required int newQuantity}) async{
    try{
    final CartModel response = await _cartDataSource.editProductQuantity(productId: productId, newQuantity: newQuantity);
    return right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCartProducts() async{
    try{
    final CartModel cartProducts = await _cartDataSource.getCartProducts();
    return right(cartProducts);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, CartModel>> removeProductFromCart({required String productId}) async{
    try{
    final CartModel response = await _cartDataSource.removeProductFromCart(productId: productId);
    return Right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> createPaymentIntent({required PaymentType paymentType, String? collectionId}) async{
    try{
      final String response = await _cartDataSource.createPaymentIntent(paymentType: paymentType, collectionId: collectionId);
      return Right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<CartOrderModel>>> getOrdersList() async{
    try{
      final List<CartOrderModel> ordersList = await _cartDataSource.getOrdersList();
      return right(ordersList);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}