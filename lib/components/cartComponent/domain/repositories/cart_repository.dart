import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart_product.dart';
import 'package:efashion_flutter/shared/error/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, String>> addProductToCart({
    required String userAccessToken,
    required String productId,
    required String productSize,
    required String productColor,
    required int productQuantity,
  });

  Future<Either<Failure, String>> removeProductFromCart({
    required String userAccessToken,
    required String productId,
  });

  Future<Either<Failure, void>> editProductQuantity({
    required String userAccessToken,
    required String productId,
    required String newQuantity,
});

  Future<Either<Failure, List<CartProduct>>> getCartProducts({
    required String userAccessToken,
});
}
