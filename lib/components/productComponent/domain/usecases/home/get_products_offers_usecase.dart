import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductsOffersUseCase{
  final ProductRepository _productRepository;
  const GetProductsOffersUseCase(this._productRepository);

  Future<Either<Failure, List<Product>>> call({String? categories, int pageNumber = 1}) async{
    return await _productRepository.getProductsOffers(categories: categories, pageNumber: pageNumber);
  }
}