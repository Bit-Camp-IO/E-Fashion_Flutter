import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveProductFromFavoriteListUseCase {
  final ProductRepository _productRepository;

  const RemoveProductFromFavoriteListUseCase(this._productRepository);

  Future<Either<Failure, String>> call({required String productId, required String userAccessToken}) async {
    return await _productRepository.removeProductFromFavoriteList(productId: productId, userAccessToken: userAccessToken);
  }
}
