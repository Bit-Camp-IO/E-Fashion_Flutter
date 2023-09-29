import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFavoriteProductsUseCase{
  final ProductRepository _productRepository;
  const GetFavoriteProductsUseCase(this._productRepository);
  Future<Either<Failure, List<ProductDetails>>> call({required Set<String> favoriteIds}) async{
    return await _productRepository.getFavoriteProducts(favoriteIds: favoriteIds);
  }
}