import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/review.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserProductReviewUseCase{
  final ProductRepository _productRepository;

  const GetUserProductReviewUseCase(this._productRepository);

  Future<Either<Failure, Review>> call({required String productId}) async{
    return await _productRepository.getUserProductReview(productId: productId);
  }
}