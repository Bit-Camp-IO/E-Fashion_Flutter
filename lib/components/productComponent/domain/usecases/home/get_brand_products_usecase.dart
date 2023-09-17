import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBrandProductsUseCase{
  final ProductRepository _productRepository;
  const GetBrandProductsUseCase(this._productRepository);

  Future<Either<Failure, List<Product>>> call({required String brandId, required int pageNumber, required String? categories}) async{
    return await _productRepository.getBrandProducts(brandId: brandId, pageNumber: pageNumber, categories: categories);
  }
}