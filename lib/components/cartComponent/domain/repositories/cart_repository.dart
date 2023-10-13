import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/shared/util/enums.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> addProductToCart({
    required String userAccessToken,
    required String productId,
    required String? productSize,
    required String? productColor,
    required int productQuantity,
  });

  Future<Either<Failure, Cart>> removeProductFromCart({
    required String userAccessToken,
    required String productId,
  });

  Future<Either<Failure, Cart>> editProductQuantity({
    required String userAccessToken,
    required String productId,
    required int newQuantity,
  });

  Future<Either<Failure, Cart>> getCartProducts({
    required String userAccessToken,
  });

  Future<Either<Failure, String>> createPaymentIntent({
    required String userAccessToken,
    required PaymentType paymentType,
    String? collectionId,
  });
}
