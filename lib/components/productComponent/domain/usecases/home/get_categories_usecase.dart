import 'package:dartz/dartz.dart';
import 'package:efashion_flutter/shared/error/failure.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCategoriesUseCase{
  final ProductRepository _productRepository;
  const GetCategoriesUseCase(this._productRepository);

  Future<Either<Failure, List<Category>>> call({required int genderId}) async{
    return await _productRepository.getCategories(genderId: genderId);
  }
}