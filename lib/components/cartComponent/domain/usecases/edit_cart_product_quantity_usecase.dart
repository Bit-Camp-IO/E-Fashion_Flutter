import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditProductQuantityUseCase{
  final CartRepository _cartRepository;

  const EditProductQuantityUseCase(this._cartRepository);

  Future<Either<Failure, void>> call({required String userAccessToken, required String productId, required String newQuantity}) async{
    return await _cartRepository.editProductQuantity(userAccessToken: userAccessToken, productId: productId, newQuantity: newQuantity);
  }
}