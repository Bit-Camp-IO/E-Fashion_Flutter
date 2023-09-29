import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductDetailsUseCase{
  final ProductRepository _productRepository;
  GetProductDetailsUseCase(this._productRepository);

  Future<Either<Failure, ProductDetails>> call({required String productId}) async{
    return await _productRepository.getProductDetails(productId: productId);
  }
}