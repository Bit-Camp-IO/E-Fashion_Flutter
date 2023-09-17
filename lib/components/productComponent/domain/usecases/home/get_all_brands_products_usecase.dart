import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';

@lazySingleton
class GetAllBrandsProductsUseCase{
  final ProductRepository _productRepository;

  const GetAllBrandsProductsUseCase(this._productRepository);
  Future<Either<Failure, Map<String, List<Product>>>> call({required List<Brand> brandsList, String? categories}) async{
    return await _productRepository.getAllBrandsProducts(brandsList: brandsList, categories: categories);
  }
}