import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProductToFavoriteListUseCase {
  final ProductRepository _productRepository;

  const AddProductToFavoriteListUseCase(this._productRepository);

  Future<Either<Failure, Set<String>>> call({required String productId, required String userAccessToken}) async {
    return await _productRepository.addProductToFavoriteList(productId: productId, userAccessToken: userAccessToken);
  }
}
