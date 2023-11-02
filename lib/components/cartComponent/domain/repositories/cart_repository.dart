import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart_order.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/shared/util/enums.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> addProductToCart({
    required String productId,
    required String? productSize,
    required String? productColor,
    required int productQuantity,
  });

  Future<Either<Failure, Cart>> removeProductFromCart({
    required String productId,
  });

  Future<Either<Failure, Cart>> editProductQuantity({
    required String productId,
    required int newQuantity,
  });

  Future<Either<Failure, Cart>> getCartProducts();

  Future<Either<Failure, String>> createPaymentIntent({
    required PaymentType paymentType,
    String? collectionId,
  });

  Future<Either<Failure, List<CartOrder>>> getOrdersList();
}
