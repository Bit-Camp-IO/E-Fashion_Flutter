import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveProductFromCartUseCase {
  final CartRepository _cartRepository;

  const RemoveProductFromCartUseCase(this._cartRepository);

  Future<Either<Failure, Cart>> call({required String userAccessToken, required String productId}) async {
    return await _cartRepository.removeProductFromCart(userAccessToken: userAccessToken, productId: productId);
  }
}