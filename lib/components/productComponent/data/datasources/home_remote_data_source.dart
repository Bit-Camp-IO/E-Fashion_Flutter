import 'package:efashion_flutter/core/api/api_consumer.dart';
import 'package:efashion_flutter/core/constants/api_constants.dart';
import 'package:efashion_flutter/core/error/exception.dart';
import 'package:efashion_flutter/components/productComponent/data/models/brand_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/category_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_details_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories({required int genderId});

  Future<List<ProductModel>> getProductsOffers(
      {String? categories, int pageNumber});

  Future<List<BrandModel>> getBrands();

  Future<Map<String, List<ProductModel>>> getAllBrandsProducts({
    required List<Brand> brands,
    String? categories,
  });

  Future<ProductDetailsModel> geProductDetails({
    required String productId,
  });

  Future<Set<String>> getUserFavoriteList({required String userAccessToken});

  Future<Set<String>> addProductToFavoriteList({
    required String productId,
    required String userAccessToken,
  });

  Future<String> removeProductFromFavoriteList({
    required String productId,
    required String userAccessToken,
  });

  Future<List<ProductModel>> getBrandProducts(
      {required String brandId,
      required int pageNumber,
      required String? categories});
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<CategoryModel>> getCategories({required int genderId}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.categoriesEndPoint,
      queryParameters: {'gender': genderId},
    );
    List<CategoryModel> categoriesList = List.from(
      (response['data'] as List).map(
        (category) => CategoryModel.fromJson(category),
      ),
    );
    return categoriesList;
  }

  @override
  Future<List<ProductModel>> getProductsOffers(
      {String? categories, int? pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.productsEndPoint,
      queryParameters: {
        'discount': true,
        'categories': categories,
        'page': pageNumber ?? 1,
      },
    );
    List<ProductModel> offersList = List.from(
      (response['data']['products'] as List).map(
        (category) => ProductModel.fromJson(category),
      ),
    );
    return offersList;
  }

  @override
  Future<List<BrandModel>> getBrands() async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      ApiConstants.brandsEndPoint,
    );
    List<BrandModel> brandsList = List.from(
      (response['data'] as List).map(
        (category) => BrandModel.fromJson(category),
      ),
    );
    return brandsList;
  }

  @override
  Future<Map<String, List<ProductModel>>> getAllBrandsProducts(
      {required List<Brand> brands, String? categories}) async {
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
      allBrandsProducts.addAll(
        {
          brandIds[index]: List.from(
              (productsLists[index]['data']['products'] as List)
                  .map((product) => ProductModel.fromJson(product)))
        },
      );
    }
    return allBrandsProducts;
  }

  @override
  Future<ProductDetailsModel> geProductDetails(
      {required String productId}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.productDetailsEndPoint}$productId',
    );
    ProductDetailsModel productDetails =
        ProductDetailsModel.fromJson(response['data']);
    return productDetails;
  }

  @override
  Future<Set<String>> getUserFavoriteList(
      {required String userAccessToken}) async {
    final Map<String, dynamic> response =
        await _apiConsumer.get(ApiConstants.userFavoriteListEndPoint, headers: {
      'Authorization': 'Bearer $userAccessToken',
    });
    return Set<String>.from((response['data'] as List<dynamic>)
        .map((favoriteResponse) => favoriteResponse['id']));
  }

  @override
  Future<Set<String>> addProductToFavoriteList(
      {required String productId, required String userAccessToken}) async {
    final Map<String, dynamic> response = await _apiConsumer.post(
        ApiConstants.userFavoriteListEndPoint,
        body: {'id': productId},
        headers: {'Authorization': 'Bearer $userAccessToken'});
    if (response['status'] == ApiCallStatus.success.value) {
      return Set<String>.from((response['data'] as List<dynamic>)
          .map((favoriteResponse) => favoriteResponse['id']));
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<String> removeProductFromFavoriteList(
      {required String productId, required String userAccessToken}) async {
    final response = await _apiConsumer.delete(
        ApiConstants.userFavoriteListEndPoint,
        body: {'id': productId},
        headers: {'Authorization': 'Bearer $userAccessToken'});
    if (response.toString().isEmpty ) {
        throw const FetchDataException();
    } else {
      return productId;
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
}
