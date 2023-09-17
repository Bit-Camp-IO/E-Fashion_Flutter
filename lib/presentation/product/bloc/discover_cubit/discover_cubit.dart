import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart';
import 'package:efashion_flutter/core/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'discover_state.dart';

@injectable
class DiscoverCubit extends Cubit<DiscoverState> {
  final GetBrandProductsUseCase _getBrandProductsUseCase;
  final GetProductsOffersUseCase _getProductsOffersUseCase;
  int pageNumber = 0;

  DiscoverCubit(this._getBrandProductsUseCase, this._getProductsOffersUseCase)
      : super(const DiscoverState());

  Future<void> getBrandProducts(
      {required String brandId, required String? categories}) async {
    if (!state.hasProductsListReachedMax) {
      final response = await _getBrandProductsUseCase(
          pageNumber: pageNumber, brandId: brandId, categories: categories);
      response.fold(
        (failure) => emit(state.copyWith(
          discoverFailureMessage: failure.message,
          discoverState: CubitState.failure,
        )),
        (productsList) {
          if (productsList.isEmpty) {
            emit(state.copyWith(
              discoverState: CubitState.success,
              hasProductsListReachedMax: true,
            ));
          } else {
            emit(state.copyWith(
              products: List.of(state.products)..addAll(productsList),
              hasProductsListReachedMax: false,
            ));
            pageNumber++;
          }
        },
      );
    }
  }

  Future<void> getOffersProducts({required String? categories}) async {
    if (!state.hasProductsListReachedMax) {
      final response = await _getProductsOffersUseCase(
          categories: categories, pageNumber: pageNumber);
      response.fold(
        (failure) => emit(state.copyWith(
          discoverFailureMessage: failure.message,
          discoverState: CubitState.failure,
        )),
        (productsList) {
          if (productsList.isEmpty) {
            emit(state.copyWith(
              discoverState: CubitState.success,
              hasProductsListReachedMax: true,
            ));
          } else {
            emit(state.copyWith(
              products: List.of(state.products)..addAll(productsList),
              hasProductsListReachedMax: false,
            ));
            pageNumber++;
          }
        },
      );
    }
  }
}
