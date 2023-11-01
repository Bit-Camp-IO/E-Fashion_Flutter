import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/review.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/reviews_and_rating.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';

abstract class ProductRepository{
  const ProductRepository();
  Future<Either<Failure, List<Category>>> getCategories({required int genderId});
  Future<Either<Failure, List<Product>>> getProductsOffers({String? categories, int? pageNumber});
  Future<Either<Failure, List<Brand>>> getBrands();
  Future<Either<Failure, Map<String, List<Product>>>> getAllBrandsProducts({required List<Brand> brandsList, String? categories});
  Future<Either<Failure, ProductDetails>> getProductDetails({required String productId});
  Future<Either<Failure, Set<String>>> getUserFavoriteProductIds({required String userAccessToken});
  Future<Either<Failure, Set<String>>> addProductToFavoriteList({required String productId, required String userAccessToken});
  Future<Either<Failure, String>> removeProductFromFavoriteList({required String productId, required String userAccessToken});
  Future<Either<Failure, List<Product>>> getBrandProducts({required String brandId, required int pageNumber, required String? categories});
  Future<Either<Failure, List<ProductDetails>>> getFavoriteProducts({required Set<String> favoriteIds});
  Future<Either<Failure, ReviewsAndRatings>> getProductReviewsAndRatings({required productId});
  Future<Either<Failure, Review>> addOrEditProductReview({required String userAccessToken, required String productId, required double rate, String? review});
  Future<Either<Failure, Review>> getUserProductReview({required String userAccessToken, required String productId});
  Future<Either<Failure, List<Product>>> searchForProducts({required String searchQuery, required int pageNumber, String? categories, String? brands,int? minPrice, int? maxPrice});
}