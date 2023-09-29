import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserFavoriteProductsIdsUseCase{
  final ProductRepository _productRepository;
  const GetUserFavoriteProductsIdsUseCase(this._productRepository);

  Future<Either<Failure, Set<String>>> call({required String userAccessToken}) async{
    return await _productRepository.getUserFavoriteProductIds(userAccessToken: userAccessToken);
  }
}