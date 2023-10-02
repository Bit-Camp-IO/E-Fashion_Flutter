import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchForProductsUseCase {
  final ProductRepository _productRepository;

  const SearchForProductsUseCase(this._productRepository);

  Future<Either<Failure, List<Product>>> call({
    required String searchQuery,
    required int pageNumber,
    String? categories,
    String? brands,
    int? minPrice,
    int? maxPrice,
  }) async {
    return await _productRepository.searchForProducts(
      searchQuery: searchQuery,
      pageNumber: pageNumber,
      categories: categories,
      brands: brands,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }
}
