import 'package:efashion_flutter/components/productComponent/data/models/brand_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/category_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_details_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/review_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/reviews_and_rating_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';

abstract class ProductRemoteDataSource {
  Future<List<CategoryModel>> getCategories({required int genderId});

  Future<List<ProductModel>> getProductsOffers(
      {String? categories, int pageNumber});

  Future<List<BrandModel>> getBrands();

  Future<Map<String, List<ProductModel>>> getAllBrandsProducts({
    required List<Brand> brands,
    String? categories,
  });

  Future<ProductDetailsModel> getProductDetails({
    required String productId,
  });

  Future<Set<String>> getUserFavoriteProductsIds(
      {required String userAccessToken});

  Future<Set<String>> addProductToFavoriteList({
    required String productId,
    required String userAccessToken,
  });

  Future<String> removeProductFromFavoriteList({
    required String productId,
    required String userAccessToken,
  });

  Future<List<ProductModel>> getBrandProducts({
    required String brandId,
    required int pageNumber,
    required String? categories,
  });

  Future<List<ProductDetailsModel>> getFavoriteProducts({
    required Set<String> favoriteIds,
  });

  Future<ReviewsAndRatingsModel> getProductReviewsAndRatings({
    required String productId,
  });

  Future<ReviewModel> addOrEditProductReview({
    required String userAccessToken,
    required String productId,
    required double rate,
    required String? review,
  });

  Future<ReviewModel> getUserProductReview({
    required String userAccessToken,
    required String productId,
  });

  Future<List<ProductModel>> searchForProducts({
    required String searchQuery,
    required int pageNumber,
    String? categories,
    String? brands,
    int? minPrice,
    int? maxPrice,
  });
}
