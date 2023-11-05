import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source.dart';
import 'package:efashion_flutter/components/productComponent/data/models/review_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/reviews_and_rating_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:efashion_flutter/components/productComponent/data/models/brand_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/category_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_details_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProductRemoteDataSourceImpl(@Named(ApiConstants.authenticatedConsumer) this._apiConsumer);

  @override
  Future<List<CategoryModel>> getCategories({required int genderId}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.categoriesEndPoint,
      queryParameters: {'gender': genderId},
    );
    if (response['status'] == ApiCallStatus.success.value){
      return List.from(
        (response['data'] as List).map(
              (category) => CategoryModel.fromJson(category),
        ),
      );
    }else{
      throw const FetchDataException();
    }
  }

  @override
  Future<List<ProductModel>> getProductsOffers({String? categories, int? pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.productsEndPoint,
      queryParameters: {
        'discount': true,
        'categories': categories,
        'page': pageNumber ?? 1,
      },
    );
    if (response['status'] == ApiCallStatus.success.value){
      return  List.from(
        (response['data']['products'] as List).map(
              (category) => ProductModel.fromJson(category),
        ),
      );
    }else{
      throw const FetchDataException();
    }
  }

  @override
  Future<List<BrandModel>> getBrands() async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.brandsEndPoint,
    );
    if (response['status'] == ApiCallStatus.success.value){
      return  List.from((response['data'] as List).map(
              (category) => BrandModel.fromJson(category),
        ),
      );
    }else{
      throw const FetchDataException();
    }
  }

  @override
  Future<Map<String, List<ProductModel>>> getAllBrandsProducts({required List<Brand> brands, String? categories}) async {
    final List<String> brandIds = brands.map((brand) => brand.id).toList();
    final productsLists = await Future.wait(
      brandIds.map(
        (brandId) => _apiConsumer.get(
          ApiConstants.productsEndPoint,
          queryParameters: {
            'brands': brandId,
            'categories': categories,
          },
        ),
      ),
    );
    Map<String, List<ProductModel>> allBrandsProducts = {};
    for (int index = 0; index < productsLists.length; index++) {
      if(productsLists[index]['status'] == ApiCallStatus.success.value){
        allBrandsProducts.addAll(
          {
            brandIds[index]: List.from(
                (productsLists[index]['data']['products'] as List)
                    .map((product) => ProductModel.fromJson(product)))
          },
        );
      }else{
        throw const FetchDataException();
      }
    }
    return allBrandsProducts;
  }

  @override
  Future<ProductDetailsModel> getProductDetails(
      {required String productId}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.productDetailsEndPoint(productId: productId),
    );
    ProductDetailsModel productDetails =
        ProductDetailsModel.fromJson(response['data']);
    return productDetails;
  }

  @override
  Future<Set<String>> getUserFavoriteProductsIds() async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.userFavoriteListEndPoint,
      queryParameters: {"data": "id"},
    );
    if (response['status'] == ApiCallStatus.success.value){
      return Set<String>.from((response['data'] as List<dynamic>)
          .map((productId) => productId));
    } else {
      throw const FetchDataException();
    }

  }

  @override
  Future<Set<String>> addProductToFavoriteList({required String productId}) async {
    final Map<String, dynamic> response = await _apiConsumer.post(
        ApiConstants.userFavoriteListEndPoint,
        body: {'id': productId},
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return Set<String>.from((response['data'] as List<dynamic>)
          .map((favoriteResponse) => favoriteResponse['id']));
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<String> removeProductFromFavoriteList({required String productId}) async {
    final response = await _apiConsumer.delete(
        ApiConstants.userFavoriteListEndPoint,
        body: {'id': productId},
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return productId;
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<List<ProductModel>> getBrandProducts({
    required String brandId,
    required int pageNumber,
    required String? categories,
  }) async {
    final response = await _apiConsumer.get(
      ApiConstants.productsEndPoint,
      queryParameters: {
        'page': pageNumber,
        'brands': brandId,
        'categories': categories,
      },
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return List<ProductModel>.from((response['data']['products'] as List)
          .map((product) => ProductModel.fromJson(product)));
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<List<ProductDetailsModel>> getFavoriteProducts(
      {required Set<String> favoriteIds}) async {
    final productDetailsRequests = await Future.wait(
      favoriteIds.map(
        (productId) => _apiConsumer.get(
          ApiConstants.productDetailsEndPoint(productId: productId),
        ),
      ),
    );
    final List<ProductDetailsModel> products = [];
    for(Map<String, dynamic> product in productDetailsRequests) {
      if (product['status'] == ApiCallStatus.success.value) {
        products.add(ProductDetailsModel.fromJson(product['data']));
      } else {
        throw const FetchDataException();
      }
    }
    return products;
  }

  @override
  Future<ReviewsAndRatingsModel> getProductReviewsAndRatings(
      {required String productId}) async {
    final reviewsAndRatings = await _apiConsumer
        .get(ApiConstants.productReviewsEndPoint(productId: productId));
    if (reviewsAndRatings['status'] == ApiCallStatus.success.value) {
      return ReviewsAndRatingsModel.fromJson(reviewsAndRatings['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<ReviewModel> addOrEditProductReview({
    required String productId,
    required double rate,
    required String? review,
  }) async {
    final Map<String, dynamic> requestBody = {
      'rate': rate,
    };
    if(review != null){
      requestBody['comment'] = review;
    }
    final response = await _apiConsumer.post(ApiConstants.productReviewsEndPoint(productId: productId),
            body: requestBody
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return ReviewModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<ReviewModel> getUserProductReview({required String productId}) async {
    final response = await _apiConsumer.get(
        ApiConstants.userReviewEndPoint(productId: productId),
    );
    if (response['status'] == ApiCallStatus.success.value) {
      return ReviewModel.fromJson(response['data']);
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<List<ProductModel>> searchForProducts({
    required String searchQuery,
    required int pageNumber,
    String? categories,
    String? brands,
    int? minPrice,
    int? maxPrice,
  }) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.productsEndPoint,
      queryParameters: {
        'page': pageNumber,
        'search': searchQuery,
        'min-price': minPrice,
        'max-price': maxPrice,
        'categories': categories,
        'brands': brands,
      },
    );
    if(response['data']['status'] == ApiCallStatus.success){
      List<ProductModel> searchList = List.from(
        (response['data']['products'] as List).map(
              (category) => ProductModel.fromJson(category),
        ),
      );
   return searchList;
    }else{
      throw const FetchDataException();
    }
  }
}
