import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/core/error/exception.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/data/datasources/home_remote_data_source.dart';
import 'package:efashion_flutter/components/productComponent/data/models/brand_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/category_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_details_model.dart';
import 'package:efashion_flutter/components/productComponent/data/models/product_model.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository{
  final HomeRemoteDataSource _homeRemoteDataSource;
  const ProductRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories({required int genderId}) async{
    try{
      final List<CategoryModel> categoriesList = await _homeRemoteDataSource.getCategories(genderId: genderId);
      return right(categoriesList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsOffers({String? categories, int? pageNumber}) async{
    try{
      final List<ProductModel> productList = await _homeRemoteDataSource.getProductsOffers(categories: categories);
      return right(productList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<BrandModel>>> getBrands() async{
    try{
      final List<BrandModel> brandsList = await _homeRemoteDataSource.getBrands();
      return right(brandsList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<ProductModel>>>> getAllBrandsProducts({required List<Brand> brandsList, String? categories}) async{
    try{
      final Map<String, List<ProductModel>> brandsProducts = await _homeRemoteDataSource.getAllBrandsProducts(brands: brandsList, categories: categories);
      return right(brandsProducts);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, ProductDetails>> getProductDetails({required String productId}) async{
    try{
      final ProductDetailsModel allBrandsProducts = await _homeRemoteDataSource.geProductDetails(productId: productId);
      return right(allBrandsProducts);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Set<String>>> getUserFavoriteList({required String userAccessToken}) async{
    try{
      final Set<String> favoriteList = await _homeRemoteDataSource.getUserFavoriteList(userAccessToken: userAccessToken);
      return right(favoriteList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, Set<String>>> addProductToFavoriteList({required String productId, required String userAccessToken}) async{
    try{
      final Set<String> favoriteList = await _homeRemoteDataSource.addProductToFavoriteList(productId: productId, userAccessToken: userAccessToken);
      return right(favoriteList);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, String>> removeProductFromFavoriteList({required String productId, required String userAccessToken}) async {
    try{
      final String removedProductId = await _homeRemoteDataSource.removeProductFromFavoriteList(productId: productId, userAccessToken: userAccessToken);
      return right(removedProductId);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getBrandProducts({required String brandId, required int pageNumber, required String? categories}) async{
    try{
      final List<ProductModel> brandsProducts = await _homeRemoteDataSource.getBrandProducts(brandId: brandId, pageNumber: pageNumber, categories: categories);
      return right(brandsProducts);
    }on ServerException catch(exception){
      return left(ApiFailure(exception.message!));
    }
  }
}