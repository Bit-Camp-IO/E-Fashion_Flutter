import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source.dart';
import 'package:efashion_flutter/components/productComponent/data/models/review_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/review.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/reviews_and_rating.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/data/models/brand_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/category_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_details_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  const ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories(
      {required int genderId}) async {
    try {
      final List<CategoryModel> categoriesList =
          await _productRemoteDataSource.getCategories(genderId: genderId);
      return right(categoriesList);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsOffers({String? categories, int? pageNumber}) async {
    try {
      final List<ProductModel> productList = await _productRemoteDataSource.getProductsOffers(categories: categories, pageNumber: pageNumber);
      return right(productList);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<Brand>>> getBrands() async {
    try {
      final List<BrandModel> brandsList =
          await _productRemoteDataSource.getBrands();
      return right(brandsList);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<Product>>>> getAllBrandsProducts({required List<Brand> brandsList, String? categories}) async {
    try {
      final Map<String, List<ProductModel>> brandsProducts = await _productRemoteDataSource.getAllBrandsProducts(brands: brandsList, categories: categories);
      return right(brandsProducts);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, ProductDetails>> getProductDetails({required String productId}) async {
    try {
      final ProductDetailsModel allBrandsProducts = await _productRemoteDataSource.getProductDetails(productId: productId);
      return right(allBrandsProducts);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Set<String>>> getUserFavoriteProductIds() async {
    try {
      final Set<String> favoriteSet = await _productRemoteDataSource.getUserFavoriteProductsIds();
      return right(favoriteSet);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Set<String>>> addProductToFavoriteList({
    required String productId,
  }) async {
    try {
      final Set<String> favoriteList = await _productRemoteDataSource.addProductToFavoriteList(
        productId: productId,
      );
      return right(favoriteList);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> removeProductFromFavoriteList({
    required String productId,
  }) async {
    try {
      final String removedProductId = await _productRemoteDataSource.removeProductFromFavoriteList(
        productId: productId,
      );
      return right(removedProductId);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getBrandProducts({
    required String brandId,
    required int pageNumber,
    required String? categories,
  }) async {
    try {
      final List<ProductModel> brandsProducts = await _productRemoteDataSource.getBrandProducts(
        brandId: brandId,
        pageNumber: pageNumber,
        categories: categories,
      );
      return right(brandsProducts);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<ProductDetails>>> getFavoriteProducts(
      {required Set<String> favoriteIds}) async {
    try {
      final List<ProductDetailsModel> brandsProducts = await _productRemoteDataSource.getFavoriteProducts(
              favoriteIds: favoriteIds,
      );
      return right(brandsProducts);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, ReviewsAndRatings>> getProductReviewsAndRatings(
      {required productId}) async {
    try {
      final ReviewsAndRatings reviewsAndRatings = await _productRemoteDataSource
          .getProductReviewsAndRatings(productId: productId);
      return right(reviewsAndRatings);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Review>> addOrEditProductReview({
    required String productId,
    required double rate,
    String? review,
  }) async {
    try {
      final ReviewModel productReview = await _productRemoteDataSource.addOrEditProductReview(
        productId: productId,
        rate: rate,
        review: review,
      );
      return right(productReview);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Review>> getUserProductReview({
    required String productId,
  }) async {
    try {
      final ReviewModel review = await _productRemoteDataSource.getUserProductReview(
        productId: productId,
      );
      return right(review);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchForProducts({
    required String searchQuery,
    required int pageNumber,
    String? categories,
    String? brands,
    int? minPrice,
    int? maxPrice,
  }) async {
    try {
      final List<ProductModel> searchList = await _productRemoteDataSource.searchForProducts(
        searchQuery: searchQuery,
        pageNumber: pageNumber,
        categories: categories,
        brands: brands,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      return right(searchList);
    } on ServerException catch (exception) {
      return left(ApiFailure(exception.message!));
    }
  }
}
