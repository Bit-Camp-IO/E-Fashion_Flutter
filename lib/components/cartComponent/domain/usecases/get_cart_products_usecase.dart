import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCartProductsUseCase{
  final CartRepository _cartRepository;

  const GetCartProductsUseCase(this._cartRepository);
  Future<Either<Failure, Cart>> call({required String userAccessToken}) async {
    return await _cartRepository.getCartProducts(userAccessToken: userAccessToken);
  }
}