import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBrandsUseCase{
  final ProductRepository _productRepository;

 const GetBrandsUseCase(this._productRepository);

  Future<Either<Failure, List<Brand>>> call() async {
    return await _productRepository.getBrands();
  }
}