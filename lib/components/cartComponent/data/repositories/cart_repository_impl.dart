import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/data/datasources/cart_datasource.dart';
import 'package:efashion_flutter/components/cartComponent/data/models/cart_product_model.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CartRepository)
class CartRepositoryImpl extends CartRepository{
  final CartDataSource _cartDataSource;

  CartRepositoryImpl(this._cartDataSource);
  @override
  Future<Either<Failure, String>> addProductToCart({required String userAccessToken, required String productId, required String productSize, required String productColor, required int productQuantity}) async{
    try{
    final String response = await _cartDataSource.addProductToCart(userAccessToken: userAccessToken, productId: productId, productSize: productSize, productColor: productColor, productQuantity: productQuantity);
    return right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, void>> editProductQuantity({required String userAccessToken, required String productId, required String newQuantity}) async{
    try{
    final void response = await _cartDataSource.editProductQuantity(userAccessToken: userAccessToken, productId: productId, newQuantity: newQuantity);
    return right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<CartProductModel>>> getCartProducts({required String userAccessToken}) async{
    try{
    final List<CartProductModel> cartProducts = await _cartDataSource.getCartProducts(userAccessToken: userAccessToken);
    return right(cartProducts);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> removeProductFromCart({required String userAccessToken, required String productId}) async{
    try{
    final String response = await _cartDataSource.removeProductFromCart(userAccessToken: userAccessToken, productId: productId);
    return Right(response);
    }on ServerException catch(exception){
      return left(Failure(exception.message!));
    }
  }
}