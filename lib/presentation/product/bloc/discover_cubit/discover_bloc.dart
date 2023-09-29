import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'discover_state.dart';

part 'discover_event.dart';

@injectable
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetBrandProductsUseCase _getBrandProductsUseCase;
  final GetProductsOffersUseCase _getProductsOffersUseCase;
  int pageNumber = 1;

  DiscoverBloc(
    this._getBrandProductsUseCase,
    this._getProductsOffersUseCase,
  ) : super(const DiscoverState()) {
    on<GetBrandProductsEvent>(getBrandProducts, transformer: droppable());
    on<GetOffersProductsEvent>(getOffersProducts, transformer: droppable());
  }

  Future<void> getBrandProducts(
      GetBrandProductsEvent event, Emitter<DiscoverState> emit) async {
    if (!state.hasProductsListReachedMax) {
      final response = await _getBrandProductsUseCase(
        pageNumber: pageNumber,
        brandId: event.brandId,
        categories: event.categories,
      );
      response.fold(
        (failure) => emit(state.copyWith(
          discoverFailureMessage: failure.message,
          discoverState: BlocState.failure,
        )),
        (productsList) {
          if (productsList.isEmpty) {
            emit(state.copyWith(
              discoverState: BlocState.success,
              hasProductsListReachedMax: true,
            ));
          } else {
            emit(state.copyWith(
              discoverState: BlocState.success,
              products: List.of(state.products)..addAll(productsList),
              hasProductsListReachedMax: false,
            ));
            pageNumber++;
          }
        },
      );
    }
  }

  Future<void> getOffersProducts(
      GetOffersProductsEvent event, Emitter<DiscoverState> emit) async {
    if (!state.hasProductsListReachedMax) {
      final response = await _getProductsOffersUseCase(
          categories: event.categories, pageNumber: pageNumber);
      response.fold(
        (failure) => emit(state.copyWith(
          discoverFailureMessage: failure.message,
          discoverState: BlocState.failure,
        )),
        (productsList) {
          if (productsList.isEmpty) {
            emit(state.copyWith(
              discoverState: BlocState.success,
              hasProductsListReachedMax: true,
            ));
          } else {
            emit(state.copyWith(
              discoverState: BlocState.success,
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
