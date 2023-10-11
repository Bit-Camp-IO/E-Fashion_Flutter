import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/entities/cart.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditProductQuantityUseCase{
  final CartRepository _cartRepository;

  const EditProductQuantityUseCase(this._cartRepository);

  Future<Either<Failure, Cart>> call({required String userAccessToken, required String productId, required int newQuantity}) async{
    return await _cartRepository.editProductQuantity(userAccessToken: userAccessToken, productId: productId, newQuantity: newQuantity);
  }
}