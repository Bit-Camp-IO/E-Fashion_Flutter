import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProductToCartUseCase {
  final CartRepository _cartRepository;

  const AddProductToCartUseCase(this._cartRepository);

  Future<Either<Failure, Cart>> call({
    required String productId,
    required String? productSize,
    required String? productColor,
    required int productQuantity,
  }) async {
    return await _cartRepository.addProductToCart(
      productId: productId,
      productSize: productSize,
      productColor: productColor,
      productQuantity: productQuantity,
    );
  }
}
