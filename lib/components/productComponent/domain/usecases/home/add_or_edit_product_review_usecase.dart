import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/review.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddOrEditProductReviewUseCase{
  final ProductRepository _productRepository;

  const AddOrEditProductReviewUseCase(this._productRepository);

  Future<Either<Failure, Review>> call({required String productId, required double rate, String? review}) async{
    return await _productRepository.addOrEditProductReview(productId: productId, rate: rate, review: review);
  }
}