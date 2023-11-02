import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/product.dart';
import 'package:efashion_flutter/components/productComponent/domain/usecases/search/search_for_product_usecase.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';

part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchForProductsUseCase _searchForProductsUseCase;
  String searchQuery = '';
  int searchPageNumber = 1;
  String? brands;
  String? categories;
  int? minPrice;
  int? maxPrice;

  SearchBloc(this._searchForProductsUseCase) : super(const SearchState()) {
    on<SearchForProductsEvent>(
      _searchForProductsEvent,
      transformer: (events, mapper) => events
          .distinct()
          .debounceTime(const Duration(milliseconds: 700))
          .switchMap(mapper),
    );
    on<FilterSearchProductsEvent>(_filterSearchProducts, transformer: (events, mapper) => events
        .distinct()
        .switchMap(mapper),);
    on<LoadMoreSearchProductEvent>(_loadMoreProducts, transformer: droppable());
  }

  Future<void> _searchForProductsEvent(
      SearchForProductsEvent event, Emitter<SearchState> emit) async {
    if (event.searchQuery.isNotEmpty && event.searchQuery != searchQuery || state.searchState == BlocState.failure && event.searchQuery == searchQuery) {
      emit(state.copyWith(searchState: BlocState.loading));
      searchQuery = event.searchQuery;
      searchPageNumber = 1;
      final response = await _searchForProductsUseCase(
        pageNumber: searchPageNumber,
        searchQuery: searchQuery,
        brands: brands,
        categories: categories,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            searchState: BlocState.failure,
            searchFailMessage: failure.message,
          ),
        ),
        (searchProducts) {
          searchPageNumber++;
          emit(
            state.copyWith(
              hasSearchProductsListReachedMax:
                  searchProducts.length < 20 ? true : false,
              searchProducts: searchProducts,
              searchState: BlocState.success,
            ),
          );
        },
      );
    }
  }

  Future<void> _filterSearchProducts(
      FilterSearchProductsEvent event, Emitter<SearchState> emit) async {
    categories = event.categories;
    brands = event.brands;
    minPrice = event.minPrice;
    maxPrice = event.maxPrice;
    searchPageNumber = 1;
    if (searchQuery.isNotEmpty) {
      emit(state.copyWith(searchState: BlocState.loading));
      final response = await _searchForProductsUseCase(
        pageNumber: searchPageNumber,
        searchQuery: searchQuery,
        brands: brands,
        categories: categories,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            searchState: BlocState.failure,
            searchFailMessage: failure.message,
          ),
        ),
        (searchProducts) {
          searchPageNumber++;
          emit(
            state.copyWith(
              hasSearchProductsListReachedMax:
                  searchProducts.length < 20 ? true : false,
              searchProducts: searchProducts,
              searchState: BlocState.success,
            ),
          );
        },
      );
    }
  }

  Future<void> _loadMoreProducts(
      LoadMoreSearchProductEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(loadMoreProductsState: BlocState.loading));
    if (!state.hasSearchProductsListReachedMax) {
      final response = await _searchForProductsUseCase(
        pageNumber: searchPageNumber,
        searchQuery: searchQuery,
        brands: brands,
        categories: categories,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      response.fold(
        (failure) => emit(
          state.copyWith(
            searchState: BlocState.failure,
            searchFailMessage: failure.message,
          ),
        ),
        (searchProducts) {
          if (searchProducts.isNotEmpty) {
            emit(
              state.copyWith(
                searchProducts: List.of(state.searchProducts)
                  ..addAll(searchProducts),
                loadMoreProductsState: BlocState.success,
              ),
            );
            searchPageNumber++;
          } else if (searchProducts.length < 20 || searchProducts.isEmpty) {
            emit(
              state.copyWith(
                hasSearchProductsListReachedMax: true,
                loadMoreProductsState: BlocState.success,
              ),
            );
          }
        },
      );
    }
  }
}
