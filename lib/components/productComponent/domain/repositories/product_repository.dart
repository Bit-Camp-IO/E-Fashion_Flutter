import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/core/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product_details.dart';

abstract class ProductRepository{
  const ProductRepository();
  Future<Either<Failure, List<Category>>> getCategories({required int genderId});
  Future<Either<Failure, List<Product>>> getProductsOffers({String? categories, int pageNumber});
  Future<Either<Failure, List<Brand>>> getBrands();
  Future<Either<Failure, Map<String, List<Product>>>> getAllBrandsProducts({required List<Brand> brandsList, String? categories});
  Future<Either<Failure, ProductDetails>> getProductDetails({required String productId});
  Future<Either<Failure, Set<String>>> getUserFavoriteList({required String userAccessToken});
  Future<Either<Failure, Set<String>>> addProductToFavoriteList({required String productId, required String userAccessToken});
  Future<Either<Failure, String>> removeProductFromFavoriteList({required String productId, required String userAccessToken});
  Future<Either<Failure, List<Product>>> getBrandProducts({required String brandId, required int pageNumber, required String? categories});
}