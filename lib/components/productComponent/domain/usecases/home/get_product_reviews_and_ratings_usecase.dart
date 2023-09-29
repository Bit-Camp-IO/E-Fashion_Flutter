import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/reviews_and_rating.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductReviewsAndRatingsUseCase {
  final ProductRepository _productRepository;

  const GetProductReviewsAndRatingsUseCase(this._productRepository);

  Future<Either<Failure, ReviewsAndRatings>> call({required String productId}) async{
    return await _productRepository.getProductReviewsAndRatings(productId: productId);
  }
}
